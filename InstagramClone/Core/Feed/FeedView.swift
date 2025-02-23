//
//  FeedView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI

struct FeedView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: Constants.lazyVSpacing) {
                    ForEach(0...10, id: \.self) { _ in
                        FeedCell()
                    }
                }
                .padding(.top, Constants.lazyVPadding)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image("Instagram_logo")
                        .resizable()
                        .frame(
                            width: Constants.InstLogo.width,
                            height: Constants.InstLogo.height
                        )
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Image(systemName: "heart")
                        Image(systemName: "paperplane")
                    }
                    .imageScale(.large)
                }
            }
        }
    }
}

private extension FeedView {
    
    struct Constants {
        static let lazyVPadding: CGFloat = 8
        static let lazyVSpacing: CGFloat = 32
        
        struct InstLogo {
            static let width: CGFloat = 100
            static let height: CGFloat = 32
        }
    }
}

#Preview {
    FeedView()
}
