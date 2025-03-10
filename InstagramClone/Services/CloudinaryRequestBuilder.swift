//
//  DataBuilder.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import Foundation

protocol RequestBuilder {
   
    func build() throws -> URLRequest
}


struct CloudinaryRequestBuilder: RequestBuilder {
    
    let cloudName: String
    let uploadPreset: String
    let imageData: Data
    let fileName: String
    let imageType: String
    
    private let boundary = UUID().uuidString
    
    private var url: URL? {
        URL(string: "https://api.cloudinary.com/v1_1/\(cloudName)/image/upload")
    }
    
    
    func build() throws -> URLRequest {
        
        guard let url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(
            "multipart/form-data; boundary=\(boundary)",
            forHTTPHeaderField: "Content-Type"
        )
        
        request.httpBody = createBody()
        
        return request
    }
    
    private func createBody() -> Data {
        var body = Data()
        
        func append(_ text: String) {
            body.append("\(text)\r\n".data(using: .utf8)!)
        }
        
        // Preset
        append("--\(boundary)")
        append("Content-Disposition: form-data; name=\"upload_preset\"")
        append("")
        append(uploadPreset)
        
        // File
        append("--\(boundary)")
        append("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"")
        append("Content-Type: image/\(imageType)")
        append("")
        body.append(imageData)
        append("")
        
        // Close body
        append("--\(boundary)--")
        
        return body
    }
}

