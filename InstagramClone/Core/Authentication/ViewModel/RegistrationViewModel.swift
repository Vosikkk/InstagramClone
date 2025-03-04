//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import Observation


@Observable
final class RegistrationViewModel {
    
    var username: String = ""
    var password: String = ""
    var email: String = ""
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func createUser() async throws {
        try await authService.createUser(email: email, password: password, username: username)
    }
    
}
