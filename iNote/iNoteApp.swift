//
//  iNoteApp.swift
//  iNote
//
//  Created by Tanmay . on 01/02/25.
//

import Firebase
import FirebaseCore
import SwiftUI

/*
 @main
 struct iNoteApp: App {
 //    @StateObject var authViewModel = AuthViewModel()

     init() {
         FirebaseApp.configure()
     }
     
     var body: some Scene {
         // Using AuthViewModel:
         /*
          WindowGroup {
              if authViewModel.user != nil {
                  RootView()
              } else {
                  LogInView()
              }
          }
          .environmentObject(authViewModel)
          */
         
         WindowGroup {
             LogInView()
         }
     }
 }
 */

@main
struct FirebaseTutApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            LogInView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Configured Firebase")
        return true
    }
}
