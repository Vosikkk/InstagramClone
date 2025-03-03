//
//  ProfileHeadView.swift
//  InstagramClone
//
//  Created by Саша Восколович on 02.03.2025.
//

import SwiftUI

struct ProfileHeadView: View {
    
    let user: User
    let addStoryButton: Bool
    
    init(of user: User, addStoryButton: Bool) {
        self.user = user
        self.addStoryButton = addStoryButton
    }
    
    let numbers: [Int] = [123, 23, 15]
    
    var body: some View {
        VStack(spacing: Constants.spacing) {
            
            HStack {
                ProfileHeaderView<AddStoryButton>(
                    numbers: numbers,
                    image: user.profileImageURL,
                    addStoryButton: addStoryButton ? {
                        AddStoryButton(action: { print("Add strory tapped")})
                    } : nil
                )
                // TODO: Need some changes for this addStoryButton
            }
            
            VStack(alignment: .leading,
                   spacing: Constants.spacingV) {
                
                if let fullname = user.fullname {
                    Text(fullname)
                        .fontWeight(.semibold)
                }
                
                Text(user.bio ?? "")
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
    ProfileHeadView(of: User.MOCK_USERS[0], addStoryButton: true)
}
