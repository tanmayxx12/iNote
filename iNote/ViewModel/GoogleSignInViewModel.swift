//
//  GoogleSignInViewModel.swift
//  iNote
//
//  Created by Tanmay . on 03/02/25.
//

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import Foundation
import GoogleSignIn
import GoogleSignInSwift


@MainActor
final class GoogleSignInViewModel: ObservableObject {
    @Published var errorMessage: String?
    
    func signInWthGoogle() async throws {
        do {
            // 1. Configure Google Sign In:
            guard let clientID = FirebaseApp.app()?.options.clientID else {
                throw GoogleAuthError.configurationError
            }
            let config = GIDConfiguration(clientID: clientID)
            
            // Step.2: Get the root view controller:
            let scene =  UIApplication.shared.connectedScenes.first as? UIWindowScene
            guard let rootViewController =  scene?.windows.first?.rootViewController else {
                throw GoogleAuthError.viewControllerError
            }
            
            // Step.3: Start Google Sign-In flow:
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            
            // Step.4: Get Google Credentials:
            guard let idToken = result.user.idToken?.tokenString else {
                throw GoogleAuthError.missingIDToken
            }
            let accessToken = result.user.accessToken.tokenString
            let googleCredential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            // Step.5: Sign in to Firebase using Google Credentials:
            let authDataResult = try await Auth.auth().signIn(with: googleCredential)
            
            // Step.6: Save user data to Firestore
            try await Firestore.firestore().collection("users").document(authDataResult.user.uid).setData([
                "name": authDataResult.user.displayName ?? "Unknown",
                "email": authDataResult.user.email ?? "No email",
                "createdAt": Timestamp(date: Date())
                
            ])
            
            errorMessage = nil
        } catch {
            errorMessage = handleError(error)
        }
    }
    
    
    // MARK: - Error Handling
    private func handleError(_ error: Error) -> String {
        if let firebaseError = error as? AuthErrorCode {
            switch firebaseError.code {
            case .networkError:
                return "Network Error. Please check your connection."
            case .webContextAlreadyPresented:
                return "Google Sign-In is already in progress."
            case .webContextCancelled:
                return "Google Sign-In was cancelled."
            default:
                return "Unknown error occurred: \(error.localizedDescription)"
            }
        }
        return error.localizedDescription
    }
    
    enum GoogleAuthError: Error {
        case configurationError, viewControllerError, missingIDToken
    }
    
}

