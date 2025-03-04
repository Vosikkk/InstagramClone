//
//  LoginView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 24.02.2025.
//

import SwiftUI

struct LoginView: View {
   
    @State private var router = NavigationRouter()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(RegistrationViewModel.self) private var registerVM
    
    var body: some View {
        
        NavigationStack(path: $router.path) {
            
            VStack {
                
                Spacer()
                
                /// Logo
                instLogo
                
                /// text fields
                VStack {
                    TextFieldWrapper {
                        TextField( "Enter your email", text: $email)
                            .textInputAutocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                }
                
                forgotPasswordButton
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                
                BlueButton(text: "Login", action: { print("Login was tapped")})
                    .padding(.vertical)
                
                HStack {
                    line
                    
                    Text("OR")
                        .font(.headline)
                        .foregroundStyle(.gray)
                        .padding(.horizontal, Constants.horizontalTextPadding)
                    
                    line
                }
                .frame(width: Constants.hStackWidth)
                .padding(.vertical, Constants.hStackPadding)
                
                
                continueWithFacebookButton
                
                Spacer()
                
                Divider()
                Button {
                    router.navigateTo(.addEmail)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, Constants.signUpPadding)
                
            }   
            .navigationDestination(for: Destination.self) { destination in
                router.buildView(for: destination)
//                    .environment(registerVM)
            }
        }
    }
    
    
    // MARK: - View elements
    
    private var line: some View {
        Rectangle()
            .fill(.gray)
            .opacity(0.5)
            .frame(height: Constants.lineHeight)
            .frame(maxWidth: .infinity)
    }
    
    private var instLogo: some View {
        
        Image("Instagram_logo")
            .resizable()
            .scaledToFit()
            .frame(
                width: Constants.Image.width,
                height: Constants.Image.height
            )
    }
    
    
    private var forgotPasswordButton: some View {
        Button {
            print("Forgot Password Tapped")
        } label: {
            Text("Forgot Password?")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.trailing, Constants.padding)
        }
    }
    
    private var continueWithFacebookButton: some View {
        Button {
            print("Continue with Facebook tapped")
        } label: {
            HStack {
                Image("Facebook_Logo")
                    .resizable()
                    .frame(
                        width: Constants.logoWidth,
                        height: Constants.logoHeight)
                
                Text("Continue with Facebook")
                    .font(.headline)
            }
            .foregroundStyle(Color(red: 24/255, green: 119/255, blue: 242/255))
            .frame(height: Constants.continueHeight)
        }
    }
}






// MARK: - Constants

private extension LoginView {
    
    struct Constants {
        
        static let signUpPadding: CGFloat = 16
        static let linkSpacing: CGFloat = 3
        
        
        static let continueHeight: CGFloat = 44
        
        static let logoWidth: CGFloat = 20
        static let logoHeight: CGFloat = 20
        
        
        static let hStackWidth: CGFloat = 355
        static let hStackPadding: CGFloat = 8
        static let padding: CGFloat = 28
        static let lineHeight: CGFloat = 1
        
        
        
        static let horizontalTextPadding: CGFloat = 2
        
        struct Image {
            static let width: CGFloat = 220
            static let height: CGFloat = 100
        }
    }
}

#Preview {
    LoginView()
        .environment(RegistrationViewModel(authService: AuthService()))
}

