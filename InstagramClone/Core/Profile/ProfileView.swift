//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 22.02.2025.
//

import SwiftUI

struct ProfileView: View {
    
    
    let numbers: [Int] = [123, 23, 15]
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                VStack(spacing: Constants.spacing) {
                    
                    HStack {
                        ProfileHeaderView(numbers: numbers, image: "Icon")
                    }
                    
                    VStack(alignment: .leading,
                           spacing: Constants.spacingV) {
                        
                        Text("Sasha Voskolovych")
                            .fontWeight(.semibold)
                        
                        Text("Liberty")
                    }
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    HStack {
                        editButton
                            .borderedShape(RoundedRectangle(cornerRadius:  Constants.Button.cornerRadius))
                        
                        shareButton
                            .borderedShape(RoundedRectangle(cornerRadius:  Constants.Button.cornerRadius))
                        
                        addButton
                            .frame(width: Constants.Button.smallSize, height: Constants.Button.height)
                            .borderedShape(RoundedRectangle(cornerRadius:  Constants.Button.cornerRadius))
                    }
                }
                
                ProfileTabView(selectedTab: $selectedTab)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: Constants.spacing) {
                        ToolbarButton(icon: "plus.app", action: { print("Add content tapped") })
                        ToolbarButton(icon: "line.3.horizontal") { print("Settings tapped") }
                    }
                }
            }
        }
    }
    
    
    private var editButton: some View {
        Button {
            print("editButton")
        } label: {
            Text("Edit Profile")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(
                    width: Constants.Button.width,
                    height:  Constants.Button.height
                )
                .foregroundStyle(.black)
        }
    }
    
    private var shareButton: some View {
        Button {
            print("shareButton")
        } label: {
            Text("Share Profile")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(
                    width: Constants.Button.width,
                    height: Constants.Button.height
                )
                .foregroundStyle(.black)
        }
    }
    
    private var addButton: some View {
        Button {
            print("Add")
        } label: {
            Image(systemName: "person.badge.plus")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.black)
                .padding(Constants.Button.addPadding)
        }
    }
}



enum Stat: String, CaseIterable {
    case posts = "Posts"
    case followers = "Followers"
    case following = "Following"
}


private extension ProfileView {
    
    
    struct Constants {
        
        
        static let spacingV: CGFloat = 4
        
        static let spacing: CGFloat = 10
        
        struct Button {
            static let addPadding: CGFloat = 6
            static let cornerRadius: CGFloat = 6
            static let width: CGFloat = 165
            static let height: CGFloat = 32
            static let smallSize: CGFloat = 30
        }
    }
}


#Preview {
    ProfileView()
}
