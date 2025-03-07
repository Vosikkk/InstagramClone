//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//


import Observation

@Observable
final class RegistrationViewModel {
    
     var email: String = ""
     var username: String = ""
     var password: String = ""
    
    private let service: FirebaseAuthService
    
    init(service: FirebaseAuthService) {
        self.service = service
    }
    
    func createUser() async throws {
        try await service.createUser(
            email: email,
            username: username,
            password: password
        )
    }
    
    func resetFields() {
        self.email = ""
        self.username = ""
        self.password = ""
    }   
}
