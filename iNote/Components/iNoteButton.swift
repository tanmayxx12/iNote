//
//  iNoteButton.swift
//  iNote
//
//  Created by Tanmay . on 01/02/25.
//

import SwiftUI

struct iNoteButton: View {
    
    var label: String
    var iconName: String?
    var iconImage: Image?
    var action: () -> ()
    var isSignUpButton: Bool = false
    
    
    var body: some View {
        Button{
            action()
        } label: {
            HStack {
                if let iconImage = iconImage {
                    iconImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        
                } else if let  iconName = iconName {
                    Image(systemName: iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.purple)
                }
                
                Text(label)
                    .bold()
                    .foregroundStyle(isSignUpButton ? Color.white : Color.black)
            }
        }
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(isSignUpButton ? Color.purple : Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 12)
        .shadow(radius: 4, x: 0, y: 2)
        .padding(.top, 3)
        
        
    }
}

#Preview {
    VStack(spacing: 20) {
        iNoteButton(label: "Email", iconName: "envelope") {
            print("Email button tapped")
        }
        
        iNoteButton(label: "Custom Image", iconImage: Image("googleLogo")) {
            print("Custom image button tapped")
        }
        
        iNoteButton(label: "No Icon") {
            print("No icon button tapped")
        }
    }
}
