//
//  LoginView.swift
//  iNote
//
//  Created by Tanmay . on 01/02/25.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var logInVM: LogInViewModel
    @StateObject private var googleVM = GoogleSignInViewModel()
    
    @State private var isSignUp: Bool = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Image("iNoteLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                
                Text("Jot down your thoughts, anytime, anywhere.")
                    .font(.title3)
    //                .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
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
                        TextField("Email...", text: $logInVM.email)
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
                        SecureField("Password...", text: $logInVM.password)
                            .font(.headline)
                    }
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.black.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal, 12)
                    
                    if let errorMessage = logInVM.errorMessage {
                        Text(errorMessage)
                            .foregroundStyle(.red)
                            .font(.caption)
                            .padding()
                    }
                    
                    
                    iNoteButton(label: "Log In") {
                        Task {
                            await logInVM.logInUser() 
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
                            isSignUp.toggle()
                        }
                        
                        iNoteButton(label: "Sign In With Google", iconImage: Image("googleLogo")) {
                            Task {
                                await googleVM.signInWthGoogle()
                            }
                        }
                        
                        iNoteButton(label: "Sign In With Apple", iconImage: Image("appleLogo")) {
                            // Non Functional "Sign in with Apple button"
                        }
                        .disabled(true)
                        //                .opacity(0.5)
                        
                        iNoteButton(label: "Continue as a Guest", iconName: "person") {
                            //                    // Logic for when the button is tapped
                        }
                        
                    }
                    
                    
                }
                .padding(6)
                .sheet(isPresented: $isSignUp) {
                    SignUpView()
                        .presentationDragIndicator(.visible)
                }
                
            }
        }
       
    }
}

#Preview {
    LogInView()
        .environmentObject(LogInViewModel())
}
