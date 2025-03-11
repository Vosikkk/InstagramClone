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
    
    private var uiImage: UIImage?
    
    private let imageUploader: UploadImageService
    private let postUploader: UploadPostService
    
    init() {
        imageUploader = CloudinaryService()
        postUploader = FirebaseUploadPost()
    }
    
    private func loadImage(from item: PhotosPickerItem?) async {
        guard let item,
              let data = try? await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data)
        else { return }
        self.uiImage = uiImage
        await set(imageOf: Image(uiImage: uiImage))
    }
    
    @MainActor
    private func set(imageOf image: Image) {
        self.image = image
    }
    
    func uploadPost(caption: String) async {
        guard let uiImage,
                let imageData = uiImage.jpegData(compressionQuality: 0.5),
                let imageURL = try? await imageUploader.upload(
                    from: imageData,
                    fileName: UUID().uuidString
                ) else { return }
        
        do {
            try await postUploader.upload(caption, imageURL)
        } catch {
            print("❌: \(error.localizedDescription)")
        }
    }
}
