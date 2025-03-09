//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 09.03.2025.
//

import Observation
import SwiftUI
import PhotosUI
import Firebase

protocol PickerViewModel {
    
    associatedtype Item
    
    var selectedImage: Item { get }
    var image: Image? { get }
}

@Observable
final class EditPhotoPickerViewModel: PickerViewModel {
   
    var user: User
    
    var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(from: selectedImage) }
        }
    }
    
    var image: Image?
    
    
    var fullName: String = ""
    var bio: String = ""
    
    
    init(user: User) {
        self.user = user
    }
    
    
    private func loadImage(from item: PhotosPickerItem?) async {
        guard let item,
              let data = try? await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data)
        else { return }
        await set(imageOf: Image(uiImage: uiImage))
    }
    
    @MainActor
    private func set(imageOf image: Image) {
        self.image = image
    }
    
    func updateUserData() async throws {
        let trimmedFullName = fullName.trimmed
        let trimmedBio = bio.trimmed
        
        var data: [String: Any] = [:]
        
        if isChanged(newData: trimmedFullName, oldData: user.fullname) {
            data["fullname"] = trimmedFullName
        }
        
        if isChanged(newData: trimmedBio, oldData: user.bio) {
            data["bio"] = trimmedBio
        }
        
        if !data.isEmpty {
            try await Firestore
                .firestore()
                .collection("users")
                .document(user.id)
                .updateData(data)
        }
    }
    
    
    private func isChanged(newData: String, oldData: String?) -> Bool {
        !newData.isEmpty && newData != (oldData?.trimmed ?? "")
    }
}


extension String {
    var trimmed: Self {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
