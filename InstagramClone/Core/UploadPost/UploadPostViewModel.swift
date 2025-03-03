//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 03.03.2025.
//

import Observation
import PhotosUI
import SwiftUI

@Observable
final class UploadPostViewModel {
    
    
    var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(from: selectedImage) }
        }
    }
    
    var postImage: Image?
    
    
    
    private func loadImage(from item: PhotosPickerItem?) async {
        guard let item,
              let data = try? await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data)
        else { return }
        
        postImage = Image(uiImage: uiImage)
    }
}
