//
//  RegisterViewModel.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import Foundation
import FirebaseAuth

class RegisterViewModel: ObservableObject {
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error eith: \(error.localizedDescription)")
                } else {
                    print("Login Successful...")
                }
            }
        }
    }
}
