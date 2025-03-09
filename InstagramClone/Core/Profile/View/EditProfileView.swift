//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 07.03.2025.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var photoPickerVM: EditPhotoPickerViewModel
    
    init(of user: User) {
        photoPickerVM = .init(user: user)
    }
    
    
    var body: some View {
        
        VStack {
            /// toolbar
            VStack {
                HStack {
                    cancelButton
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    updateProfileButton
                }
                .padding(.horizontal)
                
                Divider()
            }
            
            /// edit profile picture
            
            photoPicker
                .padding(.vertical, photoPickerPadd)
            
            /// edit profile info
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name..", text: $photoPickerVM.fullName)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio..", text: $photoPickerVM.bio)
            }
            Spacer()
        }
    }
    
    private var cancelButton: some View {
        Button("Cancel") {
            dismiss()
        }
    }
    
    private var updateProfileButton: some View {
        Button {
            Task {
                try await photoPickerVM.updateUserData()
            }
        } label: {
            Text("Done")
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
    
    private var photoPicker: some View {
        
        PhotosPicker(selection: $photoPickerVM.selectedImage) {
            VStack {
                if let image = photoPickerVM.image {
                    styledImage(image)
                } else {
                    styledImage(Image(systemName: "person"))
                }
                
                Text("Edit profile picture")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Divider()
            }
        }
    }
    
    private let photoPickerPadd: CGFloat = 8
    private let photoPickerWidth: CGFloat = 80
    private let photoPickerHeight: CGFloat = 80
    
    
    func styledImage(_ image: Image) -> some View {
        image
            .resizable()
            .frame(width: photoPickerWidth, height: photoPickerHeight)
            .foregroundStyle(.white)
            .background(.gray)
            .clipShape(Circle())
    }
}

struct EditProfileRowView: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, titlePadd)
                .frame(width: titleWidth, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: height)
    }
    
    private let titlePadd: CGFloat = 8
    private let titleWidth: CGFloat = 100
    
    private let height: CGFloat = 36
}


#Preview {
    EditProfileView(of: User.MOCK_USERS[0])
}



