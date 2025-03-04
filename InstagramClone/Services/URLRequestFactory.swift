//
//  URLRequestFactory.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import Foundation

protocol URLRequestFactory {
    func createURLRequest(
        from url: URL,
        method: String,
        headers: [String: String],
        body: Data?
    ) -> URLRequest
}

final class DefaultURLRequestFactory: URLRequestFactory {
    
    
    func createURLRequest(
        from url: URL,
        method: String,
        headers: [String : String],
        body: Data?
    ) -> URLRequest {
       
        var request = URLRequest(url: url)
        request.httpMethod = method
        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        request.httpBody = body
        return request
    }
}
