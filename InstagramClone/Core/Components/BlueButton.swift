//
//  BlueButton.swift
//  InstagramClone
//
//  Created by Саша Восколович on 24.02.2025.
//

import SwiftUI

struct BlueButton: View {
    
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(
                    width: width,
                    height: height
                )
                .background(Color(.systemBlue))
                .cornerRadius(cornerRadius)
        }
    }
    private let width: CGFloat = 360
    private let height: CGFloat = 44
    private let cornerRadius: CGFloat = 8
    
}

#Preview {
    BlueButton(text: "Test", action: { })
}
