//
//  User.swift
//  InstagramClone
//
//  Created by Саша Восколович on 28.02.2025.
//

import FirebaseAuth

struct User: Identifiable, Codable, Hashable {
    
    let id: String
    var username: String
    var profileImageURL: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrent: Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        return uid == id
    }
    
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString, username: "devid", profileImageURL: nil, fullname: "David Beckham", bio: "I love football", email: "david@gmail.com"),
        .init(id: UUID().uuidString, username: "venom", profileImageURL: nil, fullname: "Eddie Brock", bio: "I love heads", email: "venom@gmail.com"),
        .init(id: UUID().uuidString, username: "ironman", profileImageURL: nil, fullname: "Tony Star", bio: "Money, Technology", email: "tony@gmail.com"),
        .init(id: UUID().uuidString, username: "spiderman", profileImageURL: nil, fullname: "Peter Parker", bio: "I like height", email: "spider@gmail.com"),
        .init(id: UUID().uuidString, username: "panther", profileImageURL: nil, fullname: "T'Challa", bio: " Wakanda", email: "panther@gmail.com"),
    ]
}
