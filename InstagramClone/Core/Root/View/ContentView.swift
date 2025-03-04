//
//  ContentView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 22.02.2025.
//

import SwiftUI

struct ContentView: View {
    let service: AuthService
    @StateObject var contentViewModel: ContentViewModel
    @State private var registerVM: RegistrationViewModel
    
    init(service: AuthService) {
        self.service = service
        _contentViewModel = StateObject(wrappedValue: ContentViewModel(service: service))
        registerVM = RegistrationViewModel(authService: service)
    }
 
    var body: some View {
        Group {
            if contentViewModel.userSession == nil {
                LoginView()
                    .environment(registerVM)
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView(service: AuthService())
}
