//
//  SignUpView.swift
//  iNote
//
//  Created by Tanmay . on 01/02/25.
//

import SwiftUI

struct SignUpView: View {
   
    @StateObject private var emailVM = SignUpViewModel()
    
    
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
                
                fieldsView
                
                Text("By Signing Up, you agree to our Terms and Conditions and Privacy Policy")
                    .multilineTextAlignment(.leading)
                
                iNoteButton(label: "Sign Up", action: {
                    Task {
                        await emailVM.signUpWithEmail()
                    }
                }, isSignUpButton: true)
                
                if emailVM.errorMessage != nil {
                    Text(emailVM.errorMessage ?? "")
                        .font(.headline)
                        .foregroundStyle(.red)
                }
                
                HStack {
                    Text("Already have an account?")
                    Text("Log In")
                        .underline()
                        .foregroundStyle(.purple)
                }
                
            }
            .padding()
            
        }
    }
}

#Preview {
    SignUpView()
}

// MARK: TextFields and SecureFields
extension SignUpView {
    var fieldsView: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .font(.title3)
                    .foregroundStyle(.purple)
                    .padding(.leading, 6)
                TextField("Full Name", text: $emailVM.name)
                    .font(.headline)
                    .autocorrectionDisabled()
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
                TextField("Email", text: $emailVM.email)
                    .font(.headline)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
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
                SecureField("Password", text: $emailVM.password)
                    .font(.headline)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
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
                SecureField("Confirm Password", text: $emailVM
                    .confirmPassword)
                    .font(.headline)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.black.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal, 12)
        }
    }
}
