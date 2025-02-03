//
//  SigUpViewModel.swift
//  iNote
//
//  Created by Tanmay . on 03/02/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// Creating a Sign Up View Model:
@MainActor
final class SignUpViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String?
    
    init() { }
    
    // MARK: - Sign Up with Email
    func signUpWithEmail() async  {
        guard validateCredentials() else { return }
    
        do {
            // Create Firebase User:
            let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
            
            // Save additional user data to the firestore:
            try await Firestore.firestore().collection("users").document(authDataResult.user.uid).setData([
                "name": name,
                "email": email,
                "createdAt": Timestamp(date: Date())
            ])
            errorMessage = nil
        } catch {
            errorMessage = handleError(error)
        }
    }
    
    // MARK: Validation
    private func validateCredentials() -> Bool {
        // Check whether the email contains "@" and "."
        guard !email.isEmpty, email.contains("@"), email.contains(".") else {
            errorMessage = "Please enter a valid email address."
            return false
        }
        
        //check whether the password is at least 8 characters long
        guard password.count >= 8 else {
            errorMessage = "Password must be at least 8 characters."
            return false
        }
        
        // Check whether the password contains at least one uppercase char and a special character:
        guard password.range(of: "[A-Z]", options: .regularExpression) != nil,
              password.range(of: "[@$!%*?&]", options: .regularExpression) != nil else {
            errorMessage = "Password must contain at least one uppercase and one special character."
            return false
        }
        
        // Check whether the password is the same as confirmPassword: 
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return false
        }
        
        errorMessage = nil
        return true
    }
}

// MARK: Error Handling
extension SignUpViewModel {
    private func handleError(_ error: Error) -> String {
        if let firebaseError = error as? AuthErrorCode {
            switch firebaseError.code {
            case .wrongPassword:
                return "Incorrect password."
            case .userNotFound:
                return "No account found with this email."
            case .emailAlreadyInUse:
                return "This email is already registered."
            case .networkError:
                return "Network error. Please check your connection."
            default:
                return "Unknown error occured."
            }
        }
        return error.localizedDescription
    }
    
    enum AuthError: Error {
        case configurationError
        case viewControllerError
    }
}
