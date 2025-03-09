//
//  UploadPickerViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 09.03.2025.
//

import PhotosUI
import Observation
import SwiftUI

@Observable
final class UploadPickerViewModel: PickerViewModel {
    
    
    var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(from: selectedImage) }
        }
    }
    
    var image: Image?
    
    
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

