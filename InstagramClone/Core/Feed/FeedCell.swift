//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI

struct FeedCell: View {
    
    let post: Post
    
    init(for post: Post) {
        self.post = post
    }
    
    var body: some View {
        VStack {
            
            HStack {
                if let user = post.user {
                    ProfileImageView(image: user.profileImageURL ?? "")
                        .frame(
                            width: Constants.ImageSize.width,
                            height: Constants.ImageSize.height
                        )
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading, Constants.buttLeadPadding)
            
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            HStack(spacing: Constants.hSpacing) {
               
                makeButton(
                    systemName: "heart",
                    action: { print("Like") }
                )
                
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
            
            Text("\(post.likes) likes")
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
            
            
            Text("6h ago")
                .font(.footnote)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, Constants.leadingPadding)
                .padding(.top, Constants.topPadding)
        }
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

#Preview {
    FeedCell(for: Post.MOCK_POST[0])
}
