//
//  PostsService .swift
//  InstagramClone
//
//  Created by Саша Восколович on 11.03.2025.
//

import Firebase


struct PostService: Fetchable, UserFetch {
    
    private let userService: UserFetch
    
    init(userService: UserFetch = UserService()) {
        self.userService = UserService()
    }
    
    func fetchBy(_ uid: String) async throws -> User {
        try await userService.fetchBy(uid)
    }
    
    
    func fetch() async throws -> [Post] {
        let documents = try await Firestore
            .firestore()
            .collection("posts")
            .getDocuments()
            .documents
        return documents
            .compactMap { try? $0.data(as: Post.self) }
    }
}
