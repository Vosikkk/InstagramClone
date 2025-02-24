//
//  LoginView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 24.02.2025.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Spacer()
                
                /// Logo
                instLogo
                
                /// text fields
                VStack {
                    setField {
                        TextField( "Enter your email", text: $email)
                            .textInputAutocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                }
                
                forgotPasswordButton
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                
                loginButton
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
                
                NavigationLink {
                    Text("Sign up")
                } label: {
                    HStack(spacing: Constants.linkSpacing) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, Constants.signUpPadding)
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
    
    
    private var loginButton: some View {
        Button {
            print("Login Tapped")
        } label: {
            Text("Login")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(
                    width: Constants.logButtonWidth,
                    height: Constants.logButtonHeight
                )
                .background(Color(.systemBlue))
                .cornerRadius(Constants.buttonCornerRadius)
        }
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

// MARK: - @ViewBuilder

private extension LoginView {
    
    
    func setField(@ViewBuilder content: () -> some View) -> some View {
        content()
            .font(.subheadline)
            .padding(Constants.Field.padding)
            .background(Color(.systemGray6))
            .cornerRadius(Constants.Field.cornerRadius)
            .padding(.horizontal, Constants.Field.horizontalPadding)
    }
}



// MARK: - Constants

private extension LoginView {
    
    struct Constants {
        
        static let signUpPadding: CGFloat = 16
        static let linkSpacing: CGFloat = 3
        
        struct Field {
            static let cornerRadius: CGFloat = 10
            static let padding: CGFloat = 12
            static let horizontalPadding: CGFloat = 24
        }
        
        static let continueHeight: CGFloat = 44
        
        static let logoWidth: CGFloat = 20
        static let logoHeight: CGFloat = 20

        
        static let hStackWidth: CGFloat = 355
        static let hStackPadding: CGFloat = 8
        static let padding: CGFloat = 28
        static let lineHeight: CGFloat = 1
        
        static let logButtonWidth: CGFloat = 355
        static let logButtonHeight: CGFloat = 44
        static let buttonCornerRadius: CGFloat = 8
        
        static let horizontalTextPadding: CGFloat = 2
        
        struct Image {
            static let width: CGFloat = 220
            static let height: CGFloat = 100
        }
    }
}

#Preview {
    LoginView()
}
