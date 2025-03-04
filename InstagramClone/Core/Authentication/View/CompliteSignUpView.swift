//
//  CompliteSignUpView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 27.02.2025.
//

import SwiftUI

struct CompliteSignUpView: View {
    
    @Environment(NavigationRouter.self) private var router
    @Environment(RegistrationViewModel.self) private var registerVM
    
    let set: FeedSet
    
    var body: some View {
        
        VStack(spacing: vPadding) {
            
            Spacer()
            
            Text(set.title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text(set.subtitle)
                .font(.footnote)
                
                .multilineTextAlignment(.center)
                .padding(.horizontal, secondTextPadding)
            
            BlueButton(text: set.placeholder) {
                Task {
                    try? await registerVM.createUser()
                }
            }
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        router.goBack()
                    }
            }
        }
    }
    
    private let vPadding: CGFloat = 12
    private let secondTextPadding: CGFloat = 24
}
    


#Preview {
    CompliteSignUpView(set: FeedSet.signup)
        .environment(NavigationRouter())
        .environment(RegistrationViewModel(authService: AuthService()))
}
