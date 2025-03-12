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
    }
}
