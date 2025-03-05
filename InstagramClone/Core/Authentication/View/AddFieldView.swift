//
//  AddFieldView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 25.02.2025.
//

import SwiftUI

struct AddFieldView: View {

    
    @Binding var text: String
    let configuration: RegisterConfiguration
    
   
    var body: some View {
       
        
        VStack(spacing: vPadding) {
            if !configuration.title.isEmpty {
                Text(configuration.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
            }
            
            if !configuration.subtitle.isEmpty {
                
                Text(configuration.subtitle)
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, secondTextPadding)
            }
            
            if let fieldType = configuration.fieldType {
                
                TextFieldWrapper {
                    fieldType.view(text: $text, placeholder: configuration.placeholder)
                }
            }
            if let action = configuration.action {
                BlueButton(text: "Next", action: action)
                    .padding(.vertical)
            }
            Spacer()
        }
    }
    
    
    private let vPadding: CGFloat = 12
    private let secondTextPadding: CGFloat = 24
}

enum FieldType {
    case text
    case secure
    
    @ViewBuilder
    func view(text: Binding<String>, placeholder: String) -> some View {
        switch self {
        case .text:
            TextField(placeholder, text: text)
        case .secure:
            SecureField(placeholder, text: text)
        }
    }
}

#Preview {
    AddFieldView(text: .constant(""), configuration: RegisterConfiguration(placeholder: ""))
    
}
