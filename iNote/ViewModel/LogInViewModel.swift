//
//  LogInViewModel.swift
//  iNote
//
//  Created by Tanmay . on 02/02/25.
//

import Foundation

@MainActor
final class LogInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() { }
    
    func logIn() async throws {
        
    }
    
    
}
