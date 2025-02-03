//
//  LogInViewModel.swift
//  iNote
//
//  Created by Tanmay . on 02/02/25.
//

// Auth View Model:
/*
 import FirebaseAuth
 import FirebaseCore
 import FirebaseFirestore
 import Foundation
 import GoogleSignIn
 import GoogleSignInSwift


 @MainActor
 final class AuthViewModel: ObservableObject {
     // MARK: Published Properties
     @Published var name: String = ""
     @Published var email: String = ""
     @Published var password: String = ""
     @Published var confirmPassword: String = ""
     @Published var errorMessage: String?
     @Published var isLoading: Bool = false
     @Published var user: User?
     
     // MARK: Initialization
     init() {
         self.user = Auth.auth().currentUser
     }
     
     // MARK: Validation
     func validateCredentials(isLogIn: Bool) -> Bool {
         guard !email.isEmpty, email.contains("@"), email.contains(".") else {
             errorMessage = "Please enter a valid email address."
             return false
         }
         
         guard password.count >= 8 else {
             errorMessage = "Password must be at least 8 characters."
             return false
         }
         
         if !isLogIn {
             guard password == confirmPassword else {
                 errorMessage = "Passwords do not match."
                 return false
             }
         }
         
         guard password.rangeOfCharacter(from: .uppercaseLetters) != nil,
               password.rangeOfCharacter(from: .symbols) != nil else {
             errorMessage = "Password must contain at least one uppercase letter and one special character."
             return false
         }
         
         errorMessage = nil
         return true
     }
 }

 // MARK: Auhtentication Methods
 extension AuthViewModel {
     // email/password SignIn:
     func signInWithEmal(email: String, password: String) async {
         isLoading = true
         defer { isLoading = false }
         
         do {
             try await Auth.auth().signIn(withEmail: email, password: password)
             user = Auth.auth().currentUser
         } catch {
             errorMessage = handleAuthError(error)
         }
     }
     
     // email/password SignUp:
     func signUpWithEmail(email: String, password: String) async {
         guard validateCredentials(isLogIn: false) else { return }
         
         isLoading = true
         defer { isLoading = false }
         
         do {
             let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
             user = authDataResult.user
             // Save additional user data to firestore:
             try await Firestore.firestore().collection("users").document(authDataResult.user.uid).setData([
                 "name": name,
                 "email": email,
                 "createdAt": Timestamp(date: Date())
             ])
             
         } catch {
             errorMessage = handleAuthError(error)
         }
     }
     
     // Google Sign In:
     func signInWithGoogle() async {
         isLoading = true
         defer { isLoading = false }
         
         do {
             guard let clientID = FirebaseApp.app()?.options.clientID else {
                 throw AuthError1.configurationError
             }
             
 //            _ = GIDConfiguration(clientID: clientID)
             let scene =  UIApplication.shared.connectedScenes.first as? UIWindowScene
             guard let rootViewController =  scene?.windows.first?.rootViewController else {
                 throw AuthError1.configurationError
             }
             let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
             guard let idToken = result.user.idToken?.tokenString else {
                 throw AuthError1.configurationError
             }
             let accessToken = result.user.accessToken.tokenString
             
             let credential = GoogleAuthProvider.credential(
                 withIDToken: idToken,
                 accessToken: accessToken)
             try await Auth.auth().signIn(with: credential)
                         user = Auth.auth().currentUser
         } catch {
             errorMessage = handleAuthError(error)
         }
         
     }
     
     // Anonymous SignIn:
     func signInAnonymously() async {
         isLoading = true
         defer { isLoading = false }
         
         do {
             try await Auth.auth().signInAnonymously()
             user = Auth.auth().currentUser
         } catch {
             errorMessage = handleAuthError(error)
         }
     }
     
     
     
 }


 // MARK: Error Handling
 extension AuthViewModel {
     private func handleAuthError(_ error: Error) -> String {
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
     
     private enum AuthError1: Error {
         case configurationError
         case viewControllerError
     }
 }


 */
