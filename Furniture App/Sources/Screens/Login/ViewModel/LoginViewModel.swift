//
//  LoginViewModel.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    @Published var emailField: String = "t1@gmail.com"
    @Published var passwordField: String = "abcd12"
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
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
    
    func fetchUserProfile(uid: String, completion: @escaping (UserProfile?) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument { document, error in
            if let document = document, document.exists {
                let data = document.data()
                let fullName = data?["fullName"] as? String ?? ""
                let email = data?["email"] as? String ?? ""
                
                let userProfile = UserProfile(fullName: fullName, email: email)
                completion(userProfile)
            } else {
                print("User profile not found or error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
            }
        }
    }
}
