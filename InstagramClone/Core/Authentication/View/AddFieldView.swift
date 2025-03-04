//
//  AddFieldView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 25.02.2025.
//

import SwiftUI

struct AddFieldView: View {
    
    @Environment(NavigationRouter.self) private var router
    @Environment(RegistrationViewModel.self) private var registerVM
    
    let set: FeedSet
    let fieldType: FieldType
    let nextButtonAction: () -> Void
    
    var body: some View {
       
        
        VStack(spacing: vPadding) {
            
            Text(set.title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text(set.subtitle)
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, secondTextPadding)
            
            TextFieldWrapper {
                fieldType.view(text: textBinding(for: set), placeholder: set.placeholder)
            }
            BlueButton(text: "Next", action: nextButtonAction)
                .padding(.vertical)
            
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
    
    
    private func textBinding(for set: FeedSet) -> Binding<String> {
        @Bindable var registerVM = registerVM
        
        switch set {
        case .email:
            return $registerVM.email
        case .username:
            return $registerVM.username
        case .password:
            return $registerVM.password
        default:
            return .constant("")
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
    AddFieldView(set: FeedSet.email, fieldType: .secure, nextButtonAction: { })
    .environment(NavigationRouter())
    .environment(RegistrationViewModel(authService: AuthService()))
}
