//
//  ContentView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 22.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel(service: AuthService())
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
