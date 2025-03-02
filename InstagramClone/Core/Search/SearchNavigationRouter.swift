//
//  SearchNavigationRouter.swift
//  InstagramClone
//
//  Created by Саша Восколович on 28.02.2025.
//

import SwiftUI

@Observable
final class SearchNavigationRouter: Router {
    
    
    var path: NavigationPath = NavigationPath()
    
    
    func navigateTo(_ destination: User?) {
        if let destination {
            path.append(destination)
        }
    }
    
    @ViewBuilder
    func buildView(for destination: User) -> some View {
        ProfileView(of: destination)
            .environment(self)
    }
    
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
