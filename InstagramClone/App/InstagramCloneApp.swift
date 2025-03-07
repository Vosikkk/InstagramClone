//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Саша Восколович on 22.02.2025.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct InstagramCloneApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
   
    
    var body: some Scene {
        WindowGroup {
            ContentView(service: FirebaseAuthService())
        }
    }
}

