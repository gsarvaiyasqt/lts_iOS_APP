//
//  NetworkUrls.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 14/11/24.
//

import Foundation


struct ApiConfig {
    
    static let baseUrl = "https://qaapi.listentoseniors.com/api/"
    
    static func loginEndpoint() -> String {
        return baseUrl + "user/login"
    }
    
}
