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
                
            }
            Tab("", systemImage: "magnifyingglass", value: .search) {
                
            }
            Tab("", systemImage: "plus.square", value: .uploadPosts) {
                
            }
            Tab("", systemImage: "heart", value: .notifications) {
                
            }
            Tab("", systemImage: "person", value: .profile) {
                ProfileView()
            }
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView()
}
