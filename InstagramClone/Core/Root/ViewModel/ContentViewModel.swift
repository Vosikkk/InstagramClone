//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import FirebaseAuth
import Combine

final class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    
    private let service: AuthService
    
    init(service: AuthService) {
        self.service = service
        setupSubscribers()
    }
    
    
    private func setupSubscribers() {
        service.$userSession.sink { [weak self] in
            self?.userSession = $0
        }
        .store(in: &cancellables)
    }
}
