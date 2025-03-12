//
//  TextFieldWrapper.swift
//  InstagramClone
//
//  Created by Саша Восколович on 25.02.2025.
//

import SwiftUI

struct TextFieldWrapper<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .font(.subheadline)
            .padding(padding)
            .background(Color(.systemGray6))
            .cornerRadius(cornerRadius)
            .padding(.horizontal, horizontalPadding)
    }
    
    private let cornerRadius: CGFloat = 10
    private let padding: CGFloat = 12
    private let horizontalPadding: CGFloat = 24
    
}

