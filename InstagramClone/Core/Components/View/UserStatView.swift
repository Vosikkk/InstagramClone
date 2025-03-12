//
//  UserStatView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 22.02.2025.
//

import SwiftUI

struct UserStatView: View {
    
    let title: Stat
    let value: Int
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title.rawValue)
                .font(.footnote)
        }
        .frame(width: frameWidth)
    }
    
    private let frameWidth: CGFloat = 80
}

#Preview {
    UserStatView(title: .followers, value: 100)
}
