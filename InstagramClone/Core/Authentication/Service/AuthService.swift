//
//  AuthService.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import FirebaseAuth

final class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
//    static let shared = AuthService()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        print("Email -- \(email) Password -- \(password) Username -- \(username)")
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        
    }
    
}
