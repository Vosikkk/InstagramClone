//
//  ProfileTabView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI

struct ProfileTabView: View {
    
    @Binding var selectedTab: Int
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
                    ForEach(0...15, id: \.self) { _ in
                        Image("david-beckham2")
                            .resizable()
                            .scaledToFill()
                    }
                }
            default:
                Text("No content")
            }
        }
    }
    
    private let spacing: CGFloat = 1
}

#Preview {
    ProfileTabView(selectedTab: .constant(0))
}
