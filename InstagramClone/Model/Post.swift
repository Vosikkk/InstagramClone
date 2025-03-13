//
//  Post.swift
//  InstagramClone
//
//  Created by Саша Восколович on 02.03.2025.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    
    let id: String
    let ownerUid: String
    let caption: String
    var likes: [String: Bool]
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    
    var likeCount: Int
    
}

//extension Post {
//    
//    static var MOCK_POST: [Post] = [
//        .init(
//            id: UUID().uuidString,
//            ownerUid: UUID().uuidString,
//            caption: "This is some test caption for now",
//            likes: 0,
//            imageUrl: "david-beckham2",
//            timestamp: Timestamp(),
//            user: User.MOCK_USERS[0]),
//        
//            .init(
//                id: UUID().uuidString,
//                ownerUid: UUID().uuidString,
//                caption: "This is some test caption for now 45",
//                likes: 0,
//                imageUrl: "david-beckham1",
//                timestamp: Timestamp(),
//                user: User.MOCK_USERS[0]),
//        .init(
//            id: UUID().uuidString,
//            ownerUid: UUID().uuidString,
//            caption: "This is some test caption for now 2",
//            likes: 0,
//            imageUrl: "ironman",
//            timestamp:Timestamp(),
//            user: User.MOCK_USERS[2]),
//        .init(
//            id: UUID().uuidString,
//            ownerUid: UUID().uuidString,
//            caption: "This is some test caption for now 3",
//            likes: 0,
//            imageUrl: "Icon",
//            timestamp: Timestamp(),
//            user: User.MOCK_USERS[1]),
//        .init(
//            id: UUID().uuidString,
//            ownerUid: UUID().uuidString,
//            caption: "This is some test caption for now 4",
//            likes: 0,
//            imageUrl: "spiderman",
//            timestamp: Timestamp(),
//            user: User.MOCK_USERS[3]),
//        
//            .init(
//                id: UUID().uuidString,
//                ownerUid: UUID().uuidString,
//                caption: "This is some test caption for now 5",
//                likes: 0,
//                imageUrl: "blackpanther",
//                timestamp: Timestamp(),
//                user: User.MOCK_USERS[4]),
//        
//    ]
//}
