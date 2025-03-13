//
//  UploadPostService.swift
//  InstagramClone
//
//  Created by Саша Восколович on 11.03.2025.
//

import FirebaseAuth
import FirebaseFirestore

protocol UploadPostService {
    
    func upload(_ data: String...) async throws
    
}

protocol UpdatePostService {
    func update(id: String, data: [String: Any]) async throws
}


final class FirebaseUploadPost: UploadPostService {
   
    
    func upload(_ data: String...) async throws {
    
        guard let uid = Auth.auth().currentUser?.uid else { throw ServiceError.noCurrent }
        guard data.count == 2 else { throw ServiceError.badType(expected: "Length 2", received: "Length: \(data.count)") }
        guard let caption = data.first, let imageURL = data.last else {
            return
        }
        
        let document = Firestore.firestore().collection("posts").document()
        
        let post = Post(
            id: document.documentID,
            ownerUid: uid,
            caption: caption,
            likes: [:],
            imageUrl: imageURL,
            timestamp: Timestamp(),
            likeCount: 0
        )

        guard let encodedPost = try? Firestore.Encoder().encode(post) else {
            throw ServiceError.encodeFail
        }
    
        try await document.setData(encodedPost)
    }
}

enum ServiceError: LocalizedError {
    case encodeFail
    case badType(expected: String, received: String?)
    case noCurrent
    
    var errorDescription: String? {
        switch self {
        case .encodeFail:
            return "Failed to encode data."
        case .badType(let expected, let received):
            return "Expected type \(expected), but received \(received ?? "nil")."
        case .noCurrent:
            return "Failed to get the current user."
        }
    }
}

struct FireBaseUpdatePost: UpdatePostService {
   
    func update(id: String, data: [String : Any]) async throws {
        try await Firestore
            .firestore()
            .collection("posts")
            .document(id)
            .updateData(data)
    }
}
