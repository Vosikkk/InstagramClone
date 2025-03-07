//
//  UserService.swift
//  InstagramClone
//
//  Created by Саша Восколович on 07.03.2025.
//

import Foundation
import Firebase

struct UserService {
    
    
    func fetchAllUsers() async throws -> [User] {
        var users: [User] = []
        let documents = try await Firestore.firestore().collection("users").getDocuments().documents
        
        documents.forEach { print($0.data()) }
        
        return users
    }
    
}
