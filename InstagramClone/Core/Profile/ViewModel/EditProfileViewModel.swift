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
   
    
    var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(from: selectedImage) }
        }
    }
    
    var image: Image?
    
    
    var fullName: String = ""
    var bio: String = ""
    
    
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
}


