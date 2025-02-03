////
////  LogInViewModel.swift
////  iNote
////
////  Created by Tanmay . on 02/02/25.
////
//
//import FirebaseAuth
//import Foundation
//
//// Creating a LogInViewModel:
//
//@MainActor
//final class LogInViewModel: ObservableObject {
//    @Published var email: String = ""
//    @Published var password: String = ""
//    @Published var confirmPassword: String = ""
//    @Published var errorMessage: String = ""
//    
//    // MARK: Validation
//    func validateCredentials() -> Bool {
//        guard !email.isEmpty, email.contains("@"), email.contains(".") else {
//            errorMessage = "Please enter a valid email address."
//            return false
//        }
//        
//        guard password.count >= 8 else {
//            errorMessage = "Password must be at least 8 characters."
//            return false
//        }
//        
////        guard password.rangeOfCharacter(from: .uppercaseLetters) != nil,
////              password.rangeOfCharacter(from: .symbols) != nil else {
////            errorMessage = "Password must contain at least one uppercase letter and one special character."
////            return false
////        }
//        
//        guard password == confirmPassword else {
//            errorMessage = "Passwords do not match."
//            return false
//        }
//        
//        errorMessage = ""
//        return true
//    }
//    
//    // MARK: Log In
//    func login() {
//        guard validateCredentials() else {
//            return
//        }
//        Auth.auth().signIn(withEmail: email, password: password)
//    }
//    
//    
//}
