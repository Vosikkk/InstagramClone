//
//  PostsService .swift
//  InstagramClone
//
//  Created by Саша Восколович on 11.03.2025.
//

import Firebase


struct PostService: Fetchable, UserFetch, PostFetch {
    
    var currentUserUid: String? {
        userService.currentUserUid
    }
    
   
    
    private let userService: UserFetch
    
    private let postCollection = Firestore.firestore().collection("posts")
    
    init(userService: UserFetch = UserService()) {
        self.userService = UserService()
    }
    
    
    
    func fetchBy(_ uid: String) async throws -> User {
        try await userService.fetchBy(uid)
    }
    
    
    func fetch() async throws -> [Post] {
        
        var posts = try await postCollection
            .getDocuments()
            .documents
            .compactMap { try? $0.data(as: Post.self) }
      
        try await update(&posts)
        
        return posts
    }
    
    
    func fetchBy(_ uid: String) async throws -> [Post] {
        try await postCollection.whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
            .documents
            .compactMap { try? $0.data(as: Post.self)}
    }
    
    
    private func update(_ posts: inout [Post]) async throws {
        
        try await withThrowingTaskGroup(of: (Int, User).self) { group in
            for (index, post) in posts.enumerated() {
                group.addTask {
                    let user = try await self.userService.fetchBy(post.ownerUid)
                    return (index, user)
                }
            }
            
            for try await (index, user) in group {
                posts[index].user = user
            }
        }
    }
}

protocol PostFetch {
    func fetchBy(_ uid: String) async throws -> [Post]
}
