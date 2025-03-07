//
//  AuthService.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import FirebaseAuth
import FirebaseFirestore

final class FirebaseAuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    
    init() {
        Task { try? await loadUserData() }
    }
    
   
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            await setSessionFor(result.user)
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to login with error \(error.localizedDescription)")
        }
    }
    
    
    func createUser(email: String, username: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            await setSessionFor(result.user)
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    
    func loadUserData() async throws {
        await setSessionFor(Auth.auth().currentUser)
        guard let currentUid = userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        await updateUserUI(try? snapshot.data(as: User.self))
    }
    
    
    
    func signout() {
        try? Auth.auth().signOut()
        userSession = nil
        currentUser = nil
    }
    
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        await updateUserUI(user)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
    @MainActor
    private func updateUserUI(_ user: User?) {
        currentUser = user
    }
    
    @MainActor
    private func setSessionFor(_ user: FirebaseAuth.User?) {
        userSession = user
    }
}
