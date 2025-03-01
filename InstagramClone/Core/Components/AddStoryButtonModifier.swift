//
//  AddStoryButtonModifier.swift
//  InstagramClone
//
//  Created by Саша Восколович on 01.03.2025.
//

import SwiftUI

struct AddStoryButtonModifier: ViewModifier {
    
    var size: CGFloat = 30
    var innerSize: CGFloat = 25
    var lineWidth: CGFloat = 2
    
    func body(content: Content) -> some View {
        content
            .frame(width: innerSize, height: innerSize)
            .background(
                ZStack {
                    
                    Circle()
                        .fill(.white)
                        .frame(width: size, height: size)
                        .overlay( // Додаємо білий обідок
                            Circle()
                                .stroke(.white, lineWidth: lineWidth)
                        )
                    
                    Circle()
                        .fill(.black)
                        .frame(width: innerSize, height: innerSize)
                }
            )
            .buttonStyle(.plain)
    }
}

struct AddStoryButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .font(.system(size: 18, weight: .bold))
        }
        .addStyle()
    }
}

extension View {
    func addStyle(
        size: CGFloat = 30,
        innerSize: CGFloat = 25
    ) -> some View {
       
        modifier(
            AddStoryButtonModifier(
                size: size,
                innerSize: innerSize
            )
        )
    }
}
