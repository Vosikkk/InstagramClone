//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 07.03.2025.
//

import Observation

@Observable
final class FetchViewModel<Service: Fetchable> {
    
    var items: [Service.Model] = []
    
    
    private let service: Service
    
    
    init(service: Service) {
        self.service = service
        Task { try? await fetch() }
    }
    
    func fetch() async throws {
        items = try await service.fetch()
    }
}

