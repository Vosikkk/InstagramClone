//
//  FeedCellViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 13.03.2025.
//

import Observation

@Observable
final class FeedCellViewModel {
    
    var post: Post
    var isLiked: Bool
    
    private let service: UserFetch
    private let updateService: UpdatePostService
    

    init(post: Post,
         service: UserFetch = UserService(),
         updateService: UpdatePostService = FireBaseUpdatePost()) {
        self.post = post
        self.service = service
        self.updateService = updateService
        isLiked = service.currentUserUid.flatMap { post.likes[$0] } ?? false
    }
    
    func like() {
        
        guard let userID = service.currentUserUid else { return }
        post.likeCount += isLiked ? -1 : 1
        isLiked.toggle()
        post.likes[userID] = isLiked
        
        Task {
            try await updateService.update(id: post.id, data: ["likeCount": post.likeCount, "likes": post.likes])
        }
    }
}
