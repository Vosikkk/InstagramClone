//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import FirebaseAuth
import Combine


final class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var user: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    
    private let service: FirebaseAuthService
    
    init(service: FirebaseAuthService) {
        self.service = service
        setupSubscribers()
    }
    
    
    private func setupSubscribers() {
        service.$userSession.sink { [weak self] in
            self?.userSession = $0
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] in
            self?.user = $0
        }
        .store(in: &cancellables)
    }
    
    func signOut() {
        service.signout()
    }
}
