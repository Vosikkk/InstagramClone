//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 11.03.2025.
//

import Observation


@Observable
final class FeedViewModel<Service: Fetchable & UserFetch> where Service.Model == Post {
    
    var posts: [Service.Model] = []
    
    private let service: Service
    
    init(service: Service) {
        self.service = service
        Task { try await fetchPost() }
    }
    
    func fetchPost() async throws {
        posts = try await service.fetch()

        try await withThrowingTaskGroup(of: (Int, User).self) { group in
            for (index, post) in posts.enumerated() {
                group.addTask {
                    let user = try await self.service.fetchBy(post.ownerUid)
                    return (index, user)
                }
            }
            
            for try await (index, user) in group {
                posts[index].user = user
            }
        }
    }
}
