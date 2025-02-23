//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let numbers: [Int]
    let image: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: imageWidth, height: imageHeight)
            Spacer()
            HStack(spacing: spacing) {
                ForEach(0..<Stat.allCases.count, id: \.self) { index in
                    UserStatView(title: Stat.allCases[index], value: numbers[index])
                }
            }
        }
        .padding(.horizontal, padd)
    }
    
    
    private let imageWidth: CGFloat = 80
    private let imageHeight: CGFloat = 80
    private let spacing: CGFloat = 8
    private let padd: CGFloat = 12
}

#Preview {
    ProfileHeaderView(numbers: [1], image: "Icon")
}
