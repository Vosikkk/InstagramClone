//
//  PostGridViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 12.03.2025.
//

import Observation

@Observable
final class PostGridViewModel {
    
    var posts: [Post] = []
    
    private let user: User
    
    private let service: PostFetch
    
    
    init(user: User, service: PostService) {
        self.user = user
        self.service = service
        Task { try await fetchUserPosts() }
    }
    
    @MainActor
    private func fetchUserPosts() async throws {
        posts = try await service.fetchBy(user.id)
        
        for i in 0..<posts.count {
            posts[i].user = self.user
        }
    }
}
