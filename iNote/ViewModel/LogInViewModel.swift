//
//  LogInViewModel.swift
//  iNote
//
//  Created by Tanmay . on 02/02/25.
//

import FirebaseAuth
import Foundation

// Creating a LogInViewModel:

@MainActor
final class LogInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isAuthenticated: Bool = false
    
    init() {
        if Auth.auth().currentUser != nil {
            isAuthenticated = true 
        }
    }
    
    func logInUser() async  {
        do {
            // validate input:
            guard !email.isEmpty, !password.isEmpty else {
                throw LogInAuthError.emptyFields
            }
            
            // Firebase Auth Sign In:
            let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
            guard let user = Auth.auth().currentUser, user.uid == authDataResult.user.uid else {
                throw LogInAuthError.userNotFound
            }
            
            // User is authenticated successfully:
            isAuthenticated = true
            errorMessage = nil
        } catch {
            await MainActor.run {
                handleError(error)
            }
        }
    }
    
    private func handleError(_ error: Error) {
        if let authError = error as? LogInAuthError {
            errorMessage = authError.description
        } else {
            errorMessage = "Unknown error occurred: \(error.localizedDescription)"
        }
        isAuthenticated = false
    }
    
    
    enum LogInAuthError: Error, CustomStringConvertible {
        case emptyFields
        case userNotFound
        case invalidCredentials
        
        var description: String {
            switch self {
            case .emptyFields:
                return "Please fill in all the fields."
            case .userNotFound:
                return "User not found."
            case .invalidCredentials:
                return "Invalid email or password."
            }
        }
        
    }
    
    
}
