//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 22.02.2025.
//

import SwiftUI

struct MainTabView: View {
    
    enum TabIdentifier: Hashable {
        case feed, profile, search, uploadPosts, notifications
    }

    @State private var selectedTab: TabIdentifier = .feed
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            Tab("", systemImage: "house", value: .feed) {
                FeedView()
            }
            Tab("", systemImage: "magnifyingglass", value: .search) {
                SearchView()
            }
            Tab("", systemImage: "plus.square", value: .uploadPosts) {
                UploadPostView(tab: $selectedTab)
            }
            Tab("", systemImage: "heart", value: .notifications) {
                
            }
            Tab("", systemImage: "person", value: .profile) {
                CurrentProfileView(of: User.MOCK_USERS[1])
            }
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView()
}
