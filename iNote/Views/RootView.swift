//
//  RootView.swift
//  iNote
//
//  Created by Tanmay . on 01/02/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var AppState: LogInViewModel
    @State private var searchText: String = ""
    @State private var isShowingSettingsView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink {
                        Text("Navigated Screen")
                    } label: {
                        HStack {
                            Image(systemName: "folder")
                                .foregroundStyle(.purple)
                            Text("Notes")
                        }
                    }
                }
            }
            .navigationTitle("Folders")
            .searchable(text: $searchText)
            .toolbar {
        
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                        .tint(.purple)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isShowingSettingsView = true
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(.purple)
                    }
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    // Add a folder button:
                    Button {
                        // logic for when the folder is tapped
                    } label: {
                        Image(systemName: "folder.badge.plus")
                            .font(.title3)
                    }
                    .tint(.purple)
                    
                    Spacer()
                    
                    // Start taking notes button:
                    Button{
                        // Logic for when the notes button is tapped
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.title3)
                    }
                    .tint(.purple)
                }
                
            }
            .navigationDestination(isPresented: $isShowingSettingsView) {
                SettingsView()
            }
            .navigationSplitViewStyle(.prominentDetail)
            
        }
    }
}

#Preview {
    RootView()
        .environmentObject(LogInViewModel())
}
