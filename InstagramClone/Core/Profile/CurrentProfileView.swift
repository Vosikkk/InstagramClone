//
//  CurrentProfileView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 01.03.2025.
//

import SwiftUI

struct CurrentProfileView: View {
    
    @State private var selectedTab: Int = 0
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    let numbers: [Int] = [123, 23, 15]
    
    let user: User
    
    init(of user: User) {
        self.user = user
    }
    
    
    var posts: [Post] {
        Post.MOCK_POST.filter { $0.user == user }
    }
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                ProfileHeadView(of: user, addStoryButton: true)
                
                ProfileTabView(selectedTab: $selectedTab, posts: posts)
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: spacing) {
                        ToolbarButton(icon: "plus.app", action: { print("Add content tapped") })
                        ToolbarButton(icon: "line.3.horizontal") { authViewModel.signOut() }
                    }
                }
            }
        }
    }
    

    private let spacing: CGFloat = 10
        
       
}

#Preview {
    CurrentProfileView(of: User.MOCK_USERS[0])
}
