//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 07.03.2025.
//

import Observation

@Observable
final class SearchViewModel {
    
    var users: [User] = []
    
    init() {
        Task { try? await fetchAllUsers() }
    }
    
    func fetchAllUsers() async throws {
        users = try await UserService.fetchAllUsers()
    }
}
