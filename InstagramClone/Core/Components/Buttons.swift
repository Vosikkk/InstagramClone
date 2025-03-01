//
//  Buttons.swift
//  InstagramClone
//
//  Created by Саша Восколович on 01.03.2025.
//

import SwiftUI

struct RoundedButton: View {
    
    let action: () -> Void
    let text: String
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(
                    width: width,
                    height: height
                )
                .foregroundStyle(.black)
        }
    }
    
    private let width: CGFloat = 165
    private let height: CGFloat = 32
}


struct AddButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "person.badge.plus")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.black)
                .padding(padding)
        }
    }
    
    private let padding: CGFloat = 6
}
