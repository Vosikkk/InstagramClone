//
//  ImageRepository.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import Foundation

protocol ImageRepositoryProtocol {
    func uploadImage(data: Data, for userID: String) async throws -> String
    func getImages(for userID: String) async throws -> [String]
}

protocol StorageServiceProtocol {
    func saveImageURL(for userID: String, imageURL: String) async throws
    func fetchImageURLs(for userID: String) async throws -> [String]
}


final class ImageRepository: ImageRepositoryProtocol {
    
    
    private let cloudinaryService: CloudinaryServiceProtocol
    private let firestoreService: StorageServiceProtocol
    
    init(
        cloudinaryService: CloudinaryServiceProtocol,
        firestoreService: StorageServiceProtocol)
    {
        
        self.cloudinaryService = cloudinaryService
        self.firestoreService = firestoreService
    }
    
    
    func uploadImage(data: Data, for userID: String) async throws -> String {
        ""
    }
    
    func getImages(for userID: String) async throws -> [String] {
        [""]
    }
}
