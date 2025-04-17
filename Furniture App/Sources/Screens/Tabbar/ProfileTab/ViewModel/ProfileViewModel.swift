//
//  ProfileViewModel.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import Foundation
import FirebaseAuth

class ProfileViewModel: ObservableObject {
    @Published var isLoggedOut = false
    
    func logout(navigationManager: NavigationManager) {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                navigationManager.resetToLogin()
            }
        } catch {
            print("Logout error: \(error.localizedDescription)")
        }
    }
}
