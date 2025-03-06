//
//  AuthService.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import FirebaseAuth
import FirebaseFirestore

final class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    
    init() {
        Task {
            try? await loadUserData()
        }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            setSessionFor(result.user)
        } catch {
            print("DEBUG: Failed to login with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, username: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            setSessionFor(result.user)
            await uploadUserData(uid: result.user.uid, username: username, email: email)
            print("DEBUG: Did upload user data")
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
    }
    
    func signout() {
        try? Auth.auth().signOut()
        userSession = nil
    }
    
    private func setSessionFor(_ user: FirebaseAuth.User?) {
        userSession = user
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
}
