//
//  CircuralProfileImageView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 10.03.2025.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
}

struct CircuralProfileImageView: View {
    
    let profileImageURL: String?
    
    let size: ProfileImageSize
    
    var body: some View {
        if let imageURL = profileImageURL {
            KFImage(URL(string: imageURL))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .profileStyle()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray4))
        }
    }
    
    private let width: CGFloat = 80
    private let height: CGFloat = 80
}

#Preview {
    CircuralProfileImageView(profileImageURL: User.MOCK_USERS[0].profileImageURL, size: .large)
}



