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
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    
    static var MOCK_POST: [Post] = [
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "This is some test caption for now",
            likes: 333,
            imageUrl: "david-beckham2",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]),
        
            .init(
                id: UUID().uuidString,
                ownerUid: UUID().uuidString,
                caption: "This is some test caption for now 45",
                likes: 345,
                imageUrl: "david-beckham1",
                timestamp: Timestamp(),
                user: User.MOCK_USERS[0]),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "This is some test caption for now 2",
            likes: 104,
            imageUrl: "ironman",
            timestamp:Timestamp(),
            user: User.MOCK_USERS[2]),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "This is some test caption for now 3",
            likes: 32,
            imageUrl: "Icon",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[1]),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "This is some test caption for now 4",
            likes: 56,
            imageUrl: "spiderman",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[3]),
        
            .init(
                id: UUID().uuidString,
                ownerUid: UUID().uuidString,
                caption: "This is some test caption for now 5",
                likes: 56,
                imageUrl: "blackpanther",
                timestamp: Timestamp(),
                user: User.MOCK_USERS[4]),
        
    ]
}
