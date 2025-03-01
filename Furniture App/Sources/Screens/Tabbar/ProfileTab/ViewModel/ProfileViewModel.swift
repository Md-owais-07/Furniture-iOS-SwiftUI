//
//  ProfileViewModel.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import Foundation
import FirebaseAuth

class ProfileViewModel: ObservableObject {
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch(let err) {
            print("Logout error wit: \(err.localizedDescription)")
        }
    }
}
