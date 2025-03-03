//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 03.03.2025.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var caption: String = ""
    @State private var imagePickerPresented: Bool = false
    @State private var vm: UploadPostViewModel = .init()
    @Binding var tab: MainTabView.TabIdentifier
    
    var body: some View {
        
        VStack {
            
            /// action tool bar
            HStack {
                Button {
                    reset()
                    tab = .feed
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }

            }
            .padding(.horizontal)
            
            /// post image and caption
            HStack(spacing: spacing) {
                if let image = vm.postImage {
                     image
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: imageWidth,
                            height: imageHeight
                        )
                        .clipped()
                }
                
                TextField("Enter your caption...",
                          text: $caption,
                          axis: .vertical
                )
            }
            .padding()
            
            Spacer()
            
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $vm.selectedImage)
    }
    
    private func reset() {
        caption = ""
        vm.selectedImage = nil
        vm.postImage = nil
    }
    
    private let spacing: CGFloat = 8
    
    private let imageWidth: CGFloat = 100
    private let imageHeight: CGFloat = 100
}

#Preview {
    UploadPostView(tab: .constant(.feed))
}
