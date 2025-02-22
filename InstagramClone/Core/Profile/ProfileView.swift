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
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                VStack(spacing: Constants.spacing) {
                    
                    HStack {
                        profileImage
                            .frame(
                                width: Constants.Icon.width,
                                height: Constants.Icon.height)
                        
                        Spacer()
                        
                        HStack(spacing: Constants.Stats.hStackSpacing) {
                            ForEach(0..<Stat.allCases.count, id: \.self) { index in
                                UserStatView(title: Stat.allCases[index], value: numbers[index])
                            }
                        }
                    }
                    .padding(.horizontal, Constants.Stats.padding)
                    
                    VStack(
                        alignment: .leading,
                        spacing: Constants.nameVstackSpacing
                    ) {
                        Text("Sasha Voskolovych")
                            .fontWeight(.semibold)
                        
                        Text("Liberty")
                    }
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    editButton
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: Constants.Button.cornerRadius
                            )
                            .stroke(.gray,
                                    lineWidth: Constants.Button.lineWidth
                                   )
                        )
                    
                    Divider()
                }
                
                LazyVGrid(columns: gridItems, spacing: Constants.lazyVspacing) {
                    
                    ForEach(0...15, id: \.self) { _ in
                        Image("david-beckham2")
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingButton
                    
                }
            }
        }
        
    }
    
    private var settingButton: some View {
        Button {
            
        } label: {
            Image(systemName: "line.3.horizontal")
                .foregroundStyle(.black)
        }
    }
    
    private var editButton: some View {
        Button {
            print("Ok")
        } label: {
            Text("Edit Profile")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(
                    width: Constants.Button.width,
                    height: Constants.Button.height
                )
                .foregroundStyle(.black)
        }
    }
    
    private var profileImage: some View {
        Image("Icon")
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
    }
}

enum Stat: String, CaseIterable {
    case posts = "Posts"
    case followers = "Followers"
    case following = "Following"
}
private extension ProfileView {
    
    
    struct Constants {
        
        
        static let lazyVspacing: CGFloat = 1
        
        static let nameVstackSpacing: CGFloat = 4
        
        static let spacing: CGFloat = 10
        
        struct Button {
            static let cornerRadius: CGFloat = 6
            static let width: CGFloat = 370
            static let height: CGFloat = 32
            static let lineWidth: CGFloat = 1
        }
        
        struct Icon {
            static let width: CGFloat = 80
            static let height: CGFloat = 80
        }
        
        struct Stats {
            static let padding: CGFloat = 12
            static let hStackSpacing: CGFloat = 8
            static let frameWidth: CGFloat = 80
            static let anotherPadding: CGFloat = 4
            
        }
    }
    
}

#Preview {
    ProfileView()
}
