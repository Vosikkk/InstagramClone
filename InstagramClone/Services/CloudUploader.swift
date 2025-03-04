//
//  CloudUploader.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import Foundation

final class CloudUploader {
    
    private let config: CloudinaryConfig
    private let formDataBuilder: MultipartFormDataBuilder
    private let requestFactory: URLRequestFactory
    
    private let boundaryGenerator: () -> String
    
    
    init(
        config: CloudinaryConfig,
        formDataBuilder: MultipartFormDataBuilder = DefaultMultipartFormDataBuilder(),
        requestFactory: URLRequestFactory = DefaultURLRequestFactory(),
        boundaryGenerator: @escaping () -> String = { UUID().uuidString }
    ) {
        self.config = config
        self.formDataBuilder = formDataBuilder
        self.requestFactory = requestFactory
        self.boundaryGenerator = boundaryGenerator
    }

    func createUploadRequest(imageData: Data, fileName: String = "image.jpg", userID: User.ID) -> URLRequest {
        let boundary = boundaryGenerator()
        let parameters = ["upload-preset:": config.uploadPreset,
                          "public-id": userID
                        ]
        
        let body = formDataBuilder.buildFormData(
            boundary: boundary,
            parameters: parameters,
            fileData: imageData,
            fileName: fileName
        )
        
        let headers = ["Content-Type": "multipart/form-data; boundary=\(boundary)"]
        
        return requestFactory.createURLRequest(
            from: config.uploadURL,
            method: "POST",
            headers: headers, body: body)
    }
}

