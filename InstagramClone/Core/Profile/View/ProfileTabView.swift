//
//  ProfileTabView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI
import Kingfisher

struct ProfileTabView: View {
    
    
    @State private var postFetcher: PostGridViewModel
   
    @Binding var selectedTab: Int
    
  
    init(user: User, selectedTab: Binding<Int>) {
        postFetcher = .init(user: user, service: PostService())
        self._selectedTab = selectedTab
    }
    
    private let gridItems = Array(repeating: GridItem(.flexible(), spacing: 1), count: 3)
    
    var body: some View {
        VStack {
            Picker("Tabs", selection: $selectedTab) {
                Image(systemName: "squareshape.split.3x3")
                    .tag(0) // Your Posts
                Image(systemName: "play.rectangle")
                    .tag(1) // Shared Moments
                Image(systemName: "person.crop.square")
                    .tag(2) // Tagged Photos
            }
            .pickerStyle(.segmented)
            .padding()
            
            switch selectedTab {
            case 0:
                LazyVGrid(columns: gridItems, spacing: spacing) {
                    ForEach(postFetcher.posts) { post in
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageDimension - spacing, height: imageDimension - spacing)
                            .clipped()
                    }
                }
            default:
                Text("No content")
            }
        }
    }
    
    private let spacing: CGFloat = 1
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3)
}

#Preview {
    ProfileTabView(user: User.MOCK_USERS[0], selectedTab: .constant(0))
}
