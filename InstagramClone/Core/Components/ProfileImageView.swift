//
//  ProfileImageView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI

struct ProfileImageView: View {
    
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
    }
}
