//
//  ToolbarButton.swift
//  InstagramClone
//
//  Created by Саша Восколович on 23.02.2025.
//

import SwiftUI

struct ToolbarButton: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .foregroundStyle(.black)
        }
    }
}
#Preview {
    ToolbarButton(icon: "plus", action: {})
}
