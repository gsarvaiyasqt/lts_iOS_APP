//
//  TokenManager.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 14/11/24.
//

import Foundation

class TokenManager {
    
    // Singleton instance to access TokenManager globally
    static let shared = TokenManager()
    
    private init() {}
    
    // Use Keychain for better security or UserDefaults for now
    private let tokenKey = "authToken"
    
    // Get the token from UserDefaults (or Keychain if implemented)
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: tokenKey)
        }
        set {
            if let newToken = newValue {
                UserDefaults.standard.set(newToken, forKey: tokenKey)
            } else {
                UserDefaults.standard.removeObject(forKey: tokenKey)
            }
        }
    }
    
    // Save the token (can be called from WebService after login)
    func saveToken(_ token: String) {
        self.token = token
    }
    
    // Clear the token when logging out
    func clearToken() {
        self.token = nil
    }
    
    // Check if token exists
    func hasToken() -> Bool {
        return token != nil
    }
}
