//
//  DataBuilder.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import Foundation

protocol MultipartFormDataBuilder {
   
    func buildFormData(
        boundary: String,
        parameters: [String: String],
        fileData: Data,
        fileName: String
    ) -> Data
}



final class DefaultMultipartFormDataBuilder: MultipartFormDataBuilder {
    
    
    func buildFormData(
        boundary: String,
        parameters: [String : String],
        fileData: Data,
        fileName: String
    ) -> Data {
        
        var body = Data()
        
        for (key, value) in parameters {
            body.append(
                convertToFormData(
                    key: key,
                    value: value,
                    boundary: boundary
                )
            )
        }
        
        body.append(
            convertFileToFormData(
                fileData: fileData,
                fileName: fileName,
                mimeType: "image/jpeg", boundary: boundary
            )
        )
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        return body
    }
    
    
    
    private func convertFileToFormData(
        fileData: Data,
        fileName: String,
        mimeType: String,
        boundary: String
    ) -> Data {
        
        var data = Data()
        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append(
            "Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!
        )
        data.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
        data.append(fileData)
        data.append("\r\n".data(using: .utf8)!)
        return data
    }
    
    private func convertToFormData(
        key: String,
        value: String,
        boundary: String
    ) -> Data {
        
          var data = Data()
          data.append("--\(boundary)\r\n".data(using: .utf8)!)
          data.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
          data.append("\(value)\r\n".data(using: .utf8)!)
          return data
      }
}
