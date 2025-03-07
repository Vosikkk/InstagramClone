//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 06.03.2025.
//

import Observation


@Observable
final class LoginViewModel {
    
    var email: String = ""
    var password: String = ""
    
    
    private let service: FirebaseAuthService
    
    
    init(service: FirebaseAuthService) {
        self.service = service
    }
    
    
    func signIn() async throws {
        try await service.login(withEmail: email, password: password)
    }
    
}
