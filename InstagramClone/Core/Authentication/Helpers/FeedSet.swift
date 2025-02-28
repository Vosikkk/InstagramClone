//
//  FeedSet.swift
//  InstagramClone
//
//  Created by Саша Восколович on 28.02.2025.
//

import Foundation

struct FeedSet {
    let title: String
    let subtitle: String
    let placeholder: String
}

extension FeedSet {
    
    static let email: Self = FeedSet(title: "Add your email", subtitle: "You'll use this email to sign in to your account", placeholder: "Email")
    
    static let username: Self = FeedSet(title: "Add your username", subtitle: "This will be your username for signing in", placeholder: "Username")
    
    static let password: Self = FeedSet(title:  "Create a password", subtitle: "Your password must be at least 6 charcters in length", placeholder: "Password")
    
    static let signup: Self = FeedSet(title: "Welcome to Instagram, Sasha Voskolovych", subtitle: "Click bellow to complete registartion and start using Instagram", placeholder: "Complite sign up")
}
