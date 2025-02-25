//
//  AddEmailView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 24.02.2025.
//

import SwiftUI

struct AddEmailView: View {
    
    @State private var email: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack(spacing: vPadding) {
            
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, secondTextPadding)
            
            TextFieldWrapper {
                TextField("Email", text: $email)
            }

            
            BlueButton(text: "Next", action: { print("Next was tapped")})
                .padding(.vertical)
            
            Spacer()
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
    
    private let vPadding: CGFloat = 12
    private let secondTextPadding: CGFloat = 24
}

#Preview {
    AddEmailView()
}
