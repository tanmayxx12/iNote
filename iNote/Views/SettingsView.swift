//
//  SettingsView.swift
//  iNote
//
//  Created by Tanmay . on 03/02/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    // Change Password:
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "pencil")
                                .font(.title3)
                                .foregroundStyle(.purple)
                            Text("Change Password")
                                .foregroundStyle(.black)
                                .font(.headline)
                        }
                        
                    }
                    
                    // LogOut Button:
                    Button {
                        // Logic for when the button is tapped:
                        
                    } label: {
                        HStack {
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                                .font(.title3)
                                .tint(.purple)
                            Text("Log Out")
                                .foregroundStyle(.black)
                                .font(.headline)
                               
                        }
                    }
                    
                    // Delete Account Button:
                    Button {
                        // Logic for when the button is tapped:
                        
                    } label: {
                        HStack {
                            Image(systemName: "trash")
                                .font(.title3)
                                .tint(.red)
                            Text("Delete Account")
                                .foregroundStyle(.red)
                                .font(.headline)
                               
                        }
                    }
                    
                    
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
