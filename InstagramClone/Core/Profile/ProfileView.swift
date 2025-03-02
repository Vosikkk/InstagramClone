//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 22.02.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(SearchNavigationRouter.self) private var router
    
    let user: User
    
    init(of user: User) {
        self.user = user
    }
    
    
    var posts: [Post] {
        Post.MOCK_POST.filter { $0.user == user }
    }
    
    let numbers: [Int] = [123, 23, 15]
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
            
            ScrollView {
                
                ProfileHeadView(of: user, addStoryButton: false)
                
                ProfileTabView(selectedTab: $selectedTab, posts: posts)
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: Constants.spacing) {
                        ToolbarButton(icon: "plus.app", action: { print("Add content tapped") })
                        ToolbarButton(icon: "line.3.horizontal") { print("Settings tapped") }
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            router.goBack()
                        }
                }
            }
    }
}



enum Stat: String, CaseIterable {
    case posts = "Posts"
    case followers = "Followers"
    case following = "Following"
}


private extension ProfileView {
    
    
    struct Constants {
        
        
        static let spacingV: CGFloat = 4
        
        static let spacing: CGFloat = 10
        
        struct Button {
            static let addPadding: CGFloat = 6
            static let cornerRadius: CGFloat = 6
            static let width: CGFloat = 165
            static let height: CGFloat = 32
            static let smallSize: CGFloat = 30
        }
    }
}


#Preview {
    ProfileView(of: User.MOCK_USERS[0])
        .environment(SearchNavigationRouter())
}
