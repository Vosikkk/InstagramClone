//
//  ImageRepository.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import Firebase

protocol ImageRepositoryProtocol {
    func upload(image: UIImage) async throws -> String?
    func getImages(for userID: String) async throws -> [String]
}


final class ImageUploader: ImageRepositoryProtocol {
    
    private let cloudinaryService: CloudinaryServiceProtocol
   
    
    init(cloudinaryService: CloudinaryServiceProtocol) {
        self.cloudinaryService = cloudinaryService
    }
    
    
    func upload(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = UUID().uuidString
        return try await cloudinaryService.upload(from: imageData, fileName: fileName)
    }
    
    func getImages(for userID: String) async throws -> [String] {
        [""]
    }
}

