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
final class NavigationRouter: Router {
    
    var path = NavigationPath()
    
    
    func navigateTo(_ destination: Destination?) {
        if let destination {
            path.append(destination)
        }
    }
    
    func goBack() {
        path.removeLast()
    }
    
    
    @ViewBuilder
    func buildView(for destination: Destination) -> some View {
        let set = getFeedSet(for: destination)
        
        if destination != .signup {
            AddFieldView(set: set.0, fieldType: set.1!) {
                self.navigateTo(destination.next)
            }
            .environment(self)

        } else {
            CompliteSignUpView(set: set.0)
            .environment(self)
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
}


