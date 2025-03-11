//
//  CloudinaryService.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import Foundation


protocol UploadImageService {
    func upload(from data: Data, fileName: String) async throws -> String
}



final class CloudinaryService: UploadImageService {
    
    
    private let cloudName: String
    private let uploadPreset: String
    
    init(
        cloudName: String = "dst5mziip",
        uploadPreset: String = "1234rrr"
    ) {
        self.cloudName = cloudName
        self.uploadPreset = uploadPreset
    }
    
    
    func upload(from data: Data, fileName: String) async throws -> String {
        
        let request = try CloudinaryRequestBuilder(
            cloudName: cloudName,
            uploadPreset: uploadPreset,
            imageData: data,
            fileName: fileName,
            imageType: "jpg")
            .build()
        
        let (data, _) = try await URLSession.shared.data(for: request)
       
        if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
           let secureUrl = json["secure_url"] as? String {
           return secureUrl
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

