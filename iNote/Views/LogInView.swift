//
//  LoginView.swift
//  iNote
//
//  Created by Tanmay . on 01/02/25.
//

import SwiftUI

struct LogInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignUp: Bool = false
    
    var body: some View {
        
        
        VStack {
            Image("iNoteLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
            
            Text("Jot down your thoughts, anytime, anywhere.")
                .font(.title)
                .multilineTextAlignment(.center)
            
            VStack {
                Text("Log In")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 12)
                
                HStack {
                    Image(systemName: "envelope")
                        .font(.title3)
                        .foregroundStyle(.purple)
                        .padding(.leading, 6)
                    TextField("Email...", text: $email)
                        .font(.headline)
                }
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.black.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 12)
                
                HStack {
                    Image(systemName: "lock.fill")
                        .font(.title3)
                        .foregroundStyle(.purple)
                        .padding(.leading, 6)
                    SecureField("Password...", text: $password)
                        .font(.headline)
                }
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.black.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 12)
                
                iNoteButton(label: "Log In") {
                    // Logic for when the button is tapped
                }
                
            }
            .padding(.top)
            
            HStack {
                VStack {Divider()}
                Text("Or")
                VStack {Divider()}
            }
            .padding()
            
            VStack {
                iNoteButton(label: "Sign Up With Email", iconName: "envelope") {
                    // logic for when the button is tapped
                    isSignUp.toggle()
                }
                
                iNoteButton(label: "Sign In With Google", iconImage: Image("googleLogo")) {
                    // Logic for when the button is tapped
                }
                
                iNoteButton(label: "Sign In With Apple", iconImage: Image("appleLogo")) {
                    // Logic for when the button is tapped
                }
                   
            }
            
            Spacer()
            
        }
        .padding(6)
        .sheet(isPresented: $isSignUp) {
            SignUpView()
                .presentationDragIndicator(.visible)
        }
        
        
    }
}

#Preview {
    LogInView()
}
