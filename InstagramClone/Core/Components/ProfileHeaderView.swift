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
            ZStack {
                ProfileImageView(image: image)
                    .frame(width: imageWidth, height: imageHeight)

                Button {
                    print("Add Story tapped")
                } label: {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 25, height: 25)
                        
                        Image(systemName: "plus")
                            .foregroundStyle(.black)
                            .font(.system(size: 18, weight: .bold))
                    }
                }
                .offset(x: 30, y: 30)
                .buttonStyle(.plain)
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
    
    
    private let imageWidth: CGFloat = 80
    private let imageHeight: CGFloat = 80
    private let spacing: CGFloat = 8
    private let padd: CGFloat = 12
}

#Preview {
    ProfileHeaderView(numbers: [1, 2, 3], image: "Icon")
}
