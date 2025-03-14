//
//  UserService.swift
//  InstagramClone
//
//  Created by Саша Восколович on 07.03.2025.
//

import Foundation
import Firebase
import FirebaseAuth

protocol Fetchable {
    associatedtype Model: Decodable
   
    func fetch() async throws -> [Model]
}

protocol UserFetch {
    func fetchBy(_ uid: String) async throws -> User
    var currentUserUid: String? { get }
}


struct UserService: Fetchable, UserFetch {
   
    var currentUserUid: String? {
        Auth.auth().currentUser?.uid
    }
    
    
    func fetchBy(_ uid: String) async throws -> User {
        try await Firestore
            .firestore()
            .collection("users")
            .document(uid)
            .getDocument()
            .data(as: User.self)
    }
    
    
    func fetch() async throws -> [User] {
        let documents = try await Firestore
            .firestore()
            .collection("users")
            .getDocuments()
            .documents
        
        return documents
            .compactMap { try? $0.data(as: User.self) }
    }
}
