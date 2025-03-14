//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    
    @State private var feedCellVM: FeedCellViewModel
    
    @State private var likeAnimationViews: [LikeAnimationView] = []
    
    private let animationDuration: CGFloat = 1.0
    
    let post: Post
    
    init(for post: Post) {
        self.post = post
        feedCellVM = .init(post: post)
    }
    
    var body: some View {
        VStack {
            
            HStack {
                if let user = post.user {
                    CircuralProfileImageView(
                        profileImageURL: user.profileImageURL,
                        size: .xSmall
                    )
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading, Constants.buttLeadPadding)
            
            ZStack(alignment: .center) {
                
                    KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .clipShape(Rectangle())
                
                ForEach(likeAnimationViews) { animation in
                    animation
                        .onAppear {
                            DispatchQueue.main.asyncAfter(
                                deadline: .now() + animationDuration
                            ) {
                                likeAnimationViews.removeFirst()
                            }
                        }
                }
            }
            .onTapGesture(count: 2) {
                didTapLike()
            }
            
            
            
            HStack(spacing: Constants.hSpacing) {
               
                makeButton(
                    systemName: feedCellVM.isLiked ? "heart.fill" : "heart",
                    action: {
                        didTapLike()
                    }
                )
                .foregroundStyle(feedCellVM.isLiked ? .red : .black)
                .animation(.easeInOut(duration: 0.3), value: feedCellVM.isLiked)
                
                makeButton(
                    systemName: "bubble.right",
                    action: { print("Comment") }
                )
               
                makeButton(
                    systemName: "paperplane",
                    action: { print("Share") }
                )
                
                Spacer()
            }
            .padding(.leading, Constants.buttLeadPadding)
            .padding(.top, Constants.buttTopPadding)
            .foregroundStyle(.black)
            
            Text("\(feedCellVM.post.likeCount) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, Constants.leadingPadding)
                .padding(.top, Constants.topPadding)
            
            HStack {
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, Constants.leadingPadding)
            .padding(.top, Constants.topPadding)
            
            
            Text("\(post.timestamp.formattedDate())h ago")
                .font(.footnote)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, Constants.leadingPadding)
                .padding(.top, Constants.topPadding)
        }
    }
    
    private func didTapLike() {
        
        feedCellVM.like()
        
        guard feedCellVM.isLiked else { return }
        likeAnimationViews.append(LikeAnimationView(duration: animationDuration))
    }
    
    private func makeButton(
        systemName: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            Image(systemName: systemName)
                .imageScale(.large)
        }
    }
}

private extension FeedCell {
    
    struct Constants {
        static let hSpacing: CGFloat = 16
        
        static let buttLeadPadding: CGFloat = 8
        static let buttTopPadding: CGFloat = 4
        
        static let leadingPadding: CGFloat = 10
        static let topPadding: CGFloat = 1
        
        struct ImageSize {
            static let height: CGFloat = 40
            static let width: CGFloat = 40
        }
    }
}
//
//#Preview {
//    FeedCell(for: Post.MOCK_POST[0])
//}









