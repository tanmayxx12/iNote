//
//  SignUpView.swift
//  iNote
//
//  Created by Tanmay . on 01/02/25.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Complete your Profile")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Don't worry, only you can view your personal information.")
                        .multilineTextAlignment(.leading)
                }
                .padding(.top, 20)
                .padding()
                
                VStack {
                    HStack {
                        Image(systemName: "person")
                            .font(.title3)
                            .foregroundStyle(.purple)
                            .padding(.leading, 6)
                        TextField("Full Name", text: $name)
                            .font(.headline)
                    }
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.black.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal, 12)
                    
                    
                    HStack {
                        Image(systemName: "envelope")
                            .font(.title3)
                            .foregroundStyle(.purple)
                            .padding(.leading, 6)
                        TextField("Email", text: $email)
                            .font(.headline)
                    }
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.black.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal, 12)
                    
                    HStack {
                        Image(systemName: "lock")
                            .font(.title3)
                            .foregroundStyle(.purple)
                            .padding(.leading, 6)
                        TextField("Password", text: $password)
                            .font(.headline)
                    }
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.black.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal, 12)
                    
                    HStack {
                        Image(systemName: "lock")
                            .font(.title3)
                            .foregroundStyle(.purple)
                            .padding(.leading, 6)
                        SecureField("Confirm Password", text: $confirmPassword)
                            .font(.headline)
                    }
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.black.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal, 12)
                }
                
                Text("By Signing Up , you agree to our Terms and Conditions and Privacy Policy")
                    .multilineTextAlignment(.leading)
                
                iNoteButton(label: "Sign Up", action: {
                    // Logic for when the button is tapped
                }, isSignUpButton: true)
                
                HStack {
                    Text("Already have an account?")
                    Text("Log In")
                        .underline()
                        .foregroundStyle(.purple)  
                }
                
            }
            
          
        }
        
        
    }
}

#Preview {
    SignUpView()
}
