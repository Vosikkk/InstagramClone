//
//  CompliteSignUpView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 27.02.2025.
//

import SwiftUI

struct CompliteSignUpView: View {
    
    let configuration: RegisterConfiguration
    
    var body: some View {
        
        VStack(spacing: vPadding) {
            
            Spacer()
            
            Text(configuration.title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text(configuration.subtitle)
                .font(.footnote)
                
                .multilineTextAlignment(.center)
                .padding(.horizontal, secondTextPadding)
            
            if let action = configuration.action {
                BlueButton(text: configuration.placeholder, action: action) 
            }
            
            Spacer()
            
        }
    }
    
    private let vPadding: CGFloat = 12
    private let secondTextPadding: CGFloat = 24
}
    


#Preview {
    CompliteSignUpView(configuration: RegisterConfiguration(placeholder: "Sign Up"))
}
