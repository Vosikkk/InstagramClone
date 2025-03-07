//
//  UserService.swift
//  InstagramClone
//
//  Created by Саша Восколович on 07.03.2025.
//

import Foundation
import Firebase

struct UserService {

    static func fetchAllUsers() async throws -> [User] {
        let documents = try await Firestore.firestore().collection("users").getDocuments().documents
        
        return documents.compactMap { try? $0.data(as: User.self) }
    }
}
