//
//  RootView.swift
//  iNote
//
//  Created by Tanmay . on 01/02/25.
//

import SwiftUI

struct RootView: View {
    @State private var searchText: String = ""
    
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
                .listStyle(.sidebar)
            }
            .navigationTitle("Folders")
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                        .font(.title3)
                        .tint(.purple)
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
        }
    }
}

#Preview {
    RootView()
}
