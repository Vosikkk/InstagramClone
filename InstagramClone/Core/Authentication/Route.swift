//
//  Route.swift
//  InstagramClone
//
//  Created by Саша Восколович on 26.02.2025.
//


import SwiftUI
import Observation

protocol Router {
    
    associatedtype Destination: Hashable
    associatedtype Screen: View
    
    var path: NavigationPath { get set }
    
    func navigateTo(_ destination: Destination?)
    func goBack()
    
    @ViewBuilder
    func buildView(for destination: Destination) -> Screen
}

@Observable
final class RegistrationRouter: Router {
    
    var path: NavigationPath
    

    private let registerVM: RegistrationViewModel
    
    init(path: NavigationPath = NavigationPath(), registerVM: RegistrationViewModel) {
        self.path = path
        self.registerVM = registerVM
    }
    
    
    
    func navigateTo(_ destination: Destination?) {
        if let destination {
            path.append(destination)
        }
    }
    
    func goBack() {
        path.removeLast()
    }
    
    private func reset() {
        path = NavigationPath()
    }
    
    func buildView(for destination: Destination) -> some View {
        let set = getFeedSet(for: destination)
        
        return Group {
            if destination != .signup {
                AddFieldView(text: binding(for: destination),
                             configuration: RegisterConfiguration(
                                fieldType: set.1!,
                                placeholder: set.0.placeholder,
                                title: set.0.title,
                                subtitle: set.0.subtitle,
                                action: { self.navigateTo(destination.next) }
                             )
                )
            } else {
                CompliteSignUpView(
                    configuration: RegisterConfiguration(
                        placeholder: set.0.placeholder,
                        title: "\(set.0.title) " + registerVM.username,
                        subtitle: set.0.subtitle,
                        action: {
                            Task {
                                try? await self.registerVM.createUser()
                                self.reset()
                                self.registerVM.resetFields()
                            }
                        }
                    )
                )
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        self.goBack()
                    }
            }
        }
    }
    
    func binding(for destination: Destination) -> Binding<String> {
        @Bindable var registerVM = registerVM
          switch destination {
          case .addEmail:
              return $registerVM.email
          case .createUsername:
              return $registerVM.username
          case .createPassword:
              return $registerVM.password
          case .signup:
              return .constant("")
          }
      }
  }
        
    
    private func getFeedSet(for destination: Destination) -> (FeedSet, FieldType?) {
        switch destination {
        case .addEmail:
            return (FeedSet.email, .text)
        case .createUsername:
            return (FeedSet.username, .text)
        case .createPassword:
            return (FeedSet.password, .secure)
        case .signup:
            return (FeedSet.signup, nil)
        }
    }


struct RegisterConfiguration {
    
    let fieldType: FieldType?
    let placeholder: String
    let title: String
    let subtitle: String
    let action: (() -> Void)?
    
    init(fieldType: FieldType? = nil,
         placeholder: String,
         title: String = "",
         subtitle: String = "",
         action: (() -> Void)? = nil
    ) {
        self.fieldType = fieldType
        self.placeholder = placeholder
        self.title = title
        self.subtitle = subtitle
        self.action = action
    }
}


