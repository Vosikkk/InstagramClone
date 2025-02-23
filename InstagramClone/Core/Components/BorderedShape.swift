//
//  BorderedShape.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI

struct BorderedShapeModifier<S: Shape>: ViewModifier {
    
    let shape: S
    let color: Color
    let lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay {
                shape
                    .stroke(color, lineWidth: lineWidth)
            }
    }
}

extension View {
    
    func borderedShape<S: Shape>(_ shape: S, color: Color = .gray, lineWidth: CGFloat = 1) -> some View {
        modifier(BorderedShapeModifier(shape: shape, color: color, lineWidth: lineWidth))
    }
}
