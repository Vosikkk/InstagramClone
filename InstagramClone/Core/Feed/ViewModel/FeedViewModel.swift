//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 11.03.2025.
//

import Observation
import Firebase

@Observable
final class FeedViewModel<Service: Fetchable> {
    
    private(set) var posts: [Service.Model] = []
    
    private let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    func fetchPost() async throws {
        posts = try await service.fetch()
    }
}
