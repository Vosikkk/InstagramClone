//
//  Config.swift
//  InstagramClone
//
//  Created by Саша Восколович on 04.03.2025.
//

import Foundation

struct CloudinaryConfig {
    
    let cloudName: String
    let uploadPreset: String
    
    let baseURL: String = "https://api.cloudinary.com/v1_1"

    var uploadURL: URL {
        URL(string: "\(baseURL)/\(cloudName)/image/upload")!
    }
}
