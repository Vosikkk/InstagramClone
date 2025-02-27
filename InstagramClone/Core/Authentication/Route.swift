//
//  Route.swift
//  InstagramClone
//
//  Created by Саша Восколович on 26.02.2025.
//


import SwiftUI
import Observation

@Observable
final class NavigationRouter: ObservableObject {
    var path = NavigationPath()
    
    func navigateTo(_ destination: Destination?) {
        if let destination {
            path.append(destination)
        }
    }
    
    func goBack() {
        path.removeLast()
    }
}

enum Destination: Hashable, Equatable {
    case addEmail
    case createUsername
    case createPassword
    case signup
}

extension Destination {
    var next: Destination? {
        switch self {
        case .addEmail:
            return .createUsername
        case .createUsername:
            return .createPassword
        case .createPassword:
            return .signup
        default:
            return nil 
        }
    }
}
