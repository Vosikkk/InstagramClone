//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI

struct ProfileHeaderView<Button: View>: View {
    
    let numbers: [Int]
    let image: String?
    let addStoryButton: (() -> Button)?
    
    var body: some View {
        HStack {
            ZStack {
                Group {
                    if let image {
                        ProfileImageView(image: image)
                           
                    } else {
                        Color.clear
                    }
                }
                .frame(width: imageWidth, height: imageHeight)
                
                if let button = addStoryButton {
                    button()
                        .offset(x: x, y: y)
                }
            }
            
            Spacer()
            HStack(spacing: spacing) {
                ForEach(0..<Stat.allCases.count, id: \.self) { index in
                    UserStatView(title: Stat.allCases[index], value: numbers[index])
                }
            }
        }
        .padding(.horizontal, padd)
    }
    
    
    private let x: CGFloat = 30
    private let y: CGFloat = 30
    
    private let imageWidth: CGFloat = 80
    private let imageHeight: CGFloat = 80
    private let spacing: CGFloat = 8
    private let padd: CGFloat = 12
}

#Preview {
    ProfileHeaderView<AddStoryButton>(numbers: [1, 2, 3], image: nil, addStoryButton: { AddStoryButton(action: { print("Add strory tapped")})})
}
