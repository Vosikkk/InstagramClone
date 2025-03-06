//
//  ContentView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 22.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    let service: AuthService
    @StateObject var authViewModel: AuthViewModel
    @State private var router: RegistrationRouter
    @State private var loginViewModel: LoginViewModel
    
    
    init(service: AuthService) {
        self.service = service
        _authViewModel = StateObject(wrappedValue: AuthViewModel(service: service))
        _loginViewModel = State(wrappedValue: LoginViewModel(service: service))
        router = RegistrationRouter(registerVM: RegistrationViewModel(service: service))
    }
 
    var body: some View {
        Group {
            if authViewModel.userSession == nil {
                NavigationStack(path: $router.path) {
                    LoginView()
                        .environment(router)
                        .environment(loginViewModel)
                        .navigationDestination(for: Destination.self) { destination in
                            router.buildView(for: destination)
                        }
                }
            } else {
                MainTabView()
                    .environmentObject(authViewModel)
            }
        }
    }
}

#Preview {
    ContentView(service: AuthService())
}
