//
//  RegisterViewModel.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var fullNameField: String = ""
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    func createUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            DispatchQueue.main.async {
                if let error = error as NSError? {
                    if let errorCode = AuthErrorCode(rawValue: error.code) {
                        switch errorCode {
                        case .emailAlreadyInUse:
                            self.errorMessage = "This email is already in use."
                        case .invalidEmail:
                            self.errorMessage = "Please enter a valid email address."
                        case .weakPassword:
                            self.errorMessage = "Password must be at least 6 characters."
                        default :
                            self.errorMessage = error.localizedDescription
                        }
                    }
                    completion(false)
                } else {
                    self.errorMessage = nil
                    completion(true)
                    print("Register Successful...")
                }
            }
        }
    }
    
    func createUserProfile(uid: String, fullName: String, email: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        
        db.collection("users").document(uid).setData([
            "fullName": fullName,
            "email": email
        ]) { error in
            if let error = error {
                print("Firestore error: \(error.localizedDescription)")
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}
