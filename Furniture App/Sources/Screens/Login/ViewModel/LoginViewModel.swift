//
//  LoginViewModel.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    func loginWithFirebase(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Login error with: \(error.localizedDescription)")
                completion(false)
            } else {
                print("Login Success")
                completion(true)
            }
        }
    }
}
