//
//  ProfileImageView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI


extension Image {
    func profileStyle() -> some View {
        self
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
    }
}
