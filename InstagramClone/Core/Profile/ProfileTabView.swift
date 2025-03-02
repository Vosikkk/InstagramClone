//
//  ProfileTabView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI

struct ProfileTabView: View {
    
    @Binding var selectedTab: Int
    
    var posts: [Post]
    
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
                    ForEach(posts) { post in
                        Image(post.imageUrl)
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
    ProfileTabView(selectedTab: .constant(0), posts: Post.MOCK_POST)
}
