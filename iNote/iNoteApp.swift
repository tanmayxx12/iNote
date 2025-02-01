//
//  iNoteApp.swift
//  iNote
//
//  Created by Tanmay . on 01/02/25.
//

import FirebaseCore
import SwiftUI


@main
struct iNoteApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
