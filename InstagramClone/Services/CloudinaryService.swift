//
//  CloudinaryService.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import Foundation


protocol CloudinaryServiceProtocol {
    func upload(from data: Data, for userID: String) async throws -> String
}




final class CloudinaryService: CloudinaryServiceProtocol {
    
    private let uploader: CloudUploader
    
    
    init(uploader: CloudUploader) {
        self.uploader = uploader
    }
    
    func upload(from data: Data, for userID: User.ID) async throws -> String {
        
        let request = uploader.createUploadRequest(imageData: data, userID: userID)
        let (data, _) = try await URLSession.shared.data(for: request)
        
        if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
           let secureUrl = json["secure_url"] as? String {
            return secureUrl
        } else {
            throw URLError(.badServerResponse)
        }
    }
}
