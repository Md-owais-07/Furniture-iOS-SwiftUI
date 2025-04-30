//
//  UserSessionManager.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import SwiftUI

class UserSessionManager: ObservableObject {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    @AppStorage("userName") var userName: String = ""
    @AppStorage("userEmail") var userEmail: String = ""
}
