//
//  Destination.swift
//  InstagramClone
//
//  Created by Саша Восколович on 28.02.2025.
//

import Foundation

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
