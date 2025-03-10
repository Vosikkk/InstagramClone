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
   
    
    // MARK: Properties
    
    var user: User
    
    var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(from: selectedImage) }
        }
    }
    
    var image: Image?
    
    
    var fullName: String = ""
    var bio: String = ""
    
    private var uiImage: UIImage?
    
    private let imageUploader: UploadImageService
    
    
    // MARK: Init
    
    init(user: User) {
        self.user = user
        imageUploader = CloudinaryService()
        setFieldsOf(user)
    }
    
    
    func updateUserData() async throws {
        
        var data: [String: Any] = [:]
        
        /// update profile image if changed
        if let image = uiImage, let imageData = image.jpegData(compressionQuality: 0.5) {
            
            let imageURL = try? await imageUploader.upload(from: imageData, fileName: UUID().uuidString)
            
            data["profileImageURL"] = imageURL
            
            print("DEBUG: image successfully saved on \(String(describing: imageURL))")
        }
        
        /// dlelete spaces if needed
        let trimmedFullName = fullName.trimmed
        let trimmedBio = bio.trimmed
        
        
        /// update name if changed
        if isChanged(newData: trimmedFullName, oldData: user.fullname) {
            data["fullname"] = trimmedFullName
        }
        
        /// update bio if changed
        if isChanged(newData: trimmedBio, oldData: user.bio) {
            data["bio"] = trimmedBio
        }
        
        if !data.isEmpty {
            print("DEBUG: Data to update: \(data)")
            try await updateFirestore(with: data)
        }
    }
    
    
    /// Because I want that only UI things on Main
    @MainActor
    private func set(imageOf image: Image) {
        self.image = image
    }
    
    
    // MARK: - Helpers
    
    private func updateFirestore(with data: [String: Any]) async throws {
        try await Firestore
            .firestore()
            .collection("users")
            .document(user.id)
            .updateData(data)
        print("DEBUG: User data updated successfully")
    }
    
    private func loadImage(from item: PhotosPickerItem?) async {
        guard let item,
              let data = try? await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data)
        else { return }
        self.uiImage = uiImage
        await set(imageOf: Image(uiImage: uiImage))
    }
    
    
    private func setFieldsOf(_ user: User) {
        if let fullName = user.fullname {
            self.fullName = fullName
        }
        
        if let bio = user.bio {
            self.bio = bio
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

