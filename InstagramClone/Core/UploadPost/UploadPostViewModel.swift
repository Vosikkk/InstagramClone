//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Саша Восколович on 03.03.2025.
//

import Observation
import PhotosUI
import SwiftUI

@Observable
final class UploadPostViewModel {
    
    
    var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(from: selectedImage) }
        }
    }
    
    var postImage: Image?
    
    
    
    private func loadImage(from item: PhotosPickerItem?) async {
        guard let item,
              let data = try? await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data)
        else { return }
        await uploadImageToCloudinary(imageData: data)
        postImage = Image(uiImage: uiImage)
    }
    
    func uploadImageToCloudinary(imageData: Data) async {
           let cloudName = "dst5mziip" // 🔥 Заміни своїм Cloud Name
           let uploadPreset = "Vosik-Vos" // 🔥 Введи свій Upload Preset

           let url = URL(string: "https://api.cloudinary.com/v1_1/\(cloudName)/image/upload")!
           
           var request = URLRequest(url: url)
           request.httpMethod = "POST"

           let boundary = UUID().uuidString
           request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

           var body = Data()

           // 🔹 Додаємо upload_preset
           body.append("--\(boundary)\r\n".data(using: .utf8)!)
           body.append("Content-Disposition: form-data; name=\"upload_preset\"\r\n\r\n".data(using: .utf8)!)
           body.append("\(uploadPreset)\r\n".data(using: .utf8)!)

           // 🔹 Додаємо зображення
           body.append("--\(boundary)\r\n".data(using: .utf8)!)
           body.append("Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
           body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
           body.append(imageData)
           body.append("\r\n".data(using: .utf8)!)
           body.append("--\(boundary)--\r\n".data(using: .utf8)!)

           request.httpBody = body

           do {
               let (data, _) = try await URLSession.shared.upload(for: request, from: body)
               if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let secureUrl = json["secure_url"] as? String {
                   DispatchQueue.main.async {
                       print("Зображення завантажено: \(secureUrl)")
                   }
               }
           } catch {
               print("❌ Помилка завантаження: \(error)")
           }
       }
    
    
    
    
}
