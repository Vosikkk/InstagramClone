//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 01.03.2025.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @State private var selectedTab: Int = 0
    
    let numbers: [Int] = [123, 23, 15]
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                VStack(spacing: Constants.spacing) {
                    
                    HStack {
                        ZStack {
                            ProfileHeaderView<AddStoryButton>(numbers: numbers, image: "Icon", addStoryButton: { AddStoryButton(action: { print("Add strory tapped")}) })
                            
                        }
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
                        RoundedButton(action: { print("Add") }, text: "Edit Profile")
                            .borderedShape(RoundedRectangle(cornerRadius:  Constants.Button.cornerRadius))
                        
                        RoundedButton(action: {print("Share") } , text: "Share Profile")
                            .borderedShape(RoundedRectangle(cornerRadius:  Constants.Button.cornerRadius))
                        
                        AddButton(action: { print("Add") })
                            .frame(width: Constants.Button.smallSize, height: Constants.Button.height)
                            .borderedShape(RoundedRectangle(cornerRadius:  Constants.Button.cornerRadius))
                    }
                }
                
                ProfileTabView(selectedTab: $selectedTab)
            }
            .navigationBarBackButtonHidden()
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
    
    
    
    struct Constants {
        
        static let spacingV: CGFloat = 4
        
        static let spacing: CGFloat = 10
        
        struct Button {
            static let cornerRadius: CGFloat = 6
            static let height: CGFloat = 32
            static let smallSize: CGFloat = 30
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
