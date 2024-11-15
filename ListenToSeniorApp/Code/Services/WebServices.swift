//
//  webservices.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 13/11/24.
//

import Foundation

//final class WebService {
//    
//    
//    static let shared = WebService()
//    
//    private init() {}
//
//    static func getLoginApi(loginRequestModel:LoginReqModel) async throws -> LoginResponseModel{
//        
//        guard let urlString  =  URL(string: "https://qaapi.listentoseniors.com/api/user/login") else {
//            throw APIError.invalidURL
//        }
//        
//        var request = URLRequest(url: urlString)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
////        let requestBody = [
////            "username": username,
////            "password": password
////        ]
//        
//        request.httpBody = try JSONEncoder().encode(loginRequestModel)
//        
//        do{
//            let (data, _) = try await URLSession.shared.data(for: request)
//            let decodedResponse = try JSONDecoder().decode(LoginResponseModel.self, from: data)
//            return decodedResponse
//        }catch let decodingError as DecodingError{
//            throw APIError.decodingFailed(decodingError)
//        }catch{
//            throw APIError.requestFailed(error)
//        }
//        
//        
//    }
//    
//    
//}


import Foundation

final class WebService {
    
    static let shared = WebService()
    
    private init() {}
    
    // Token management
    private var token: String? {
        get {
            UserDefaults.standard.string(forKey: "authToken") // Or use Keychain for better security
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "authToken")
        }
    }
    
    func saveToken(_ token: String) {
        self.token = token
    }
    
    func clearToken() {
        UserDefaults.standard.removeObject(forKey: "authToken")
    }
    
    // Generic API Call Method
    func request<T: Codable, U: Codable>(
        url: String,
        method: String = "POST",
        headers: [String: String] = ["Content-Type": "application/json"],
        body: U? = nil,
        responseType: T.Type
    ) async throws -> T {
        
        // Validate URL
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        
        // Create URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        // Add headers
        var allHeaders = headers
        if let token = token {
            allHeaders["x-auth-token"] = "\(token)"
        }
        
        for (key, value) in allHeaders {
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        // Encode request body if method is not GET
        if method != "GET", let body = body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        
        // Logging Request Info
        logRequest(request: request, body: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
              throw APIError.requestFailed(
                  NSError(domain: "", code: (response as? HTTPURLResponse)?.statusCode ?? 500, userInfo: nil)
              )
          }
          
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
           
        return decodedResponse
    }
    
    // MARK: - Logging Methods
    
    private func logRequest<U: Codable>(request: URLRequest, body: U?) {
        print("---- Request Start ----")
        print("URL: \(request.url?.absoluteString ?? "Invalid URL")")
        print("Method: \(request.httpMethod ?? "Unknown Method")")
        print("Headers: \(request.allHTTPHeaderFields ?? [:])")
        if let body = body, request.httpMethod != "GET" {
            if let jsonData = try? JSONEncoder().encode(body),
               let jsonString = String(data: jsonData, encoding: .utf8) {
                print("Request Body: \(jsonString)")
            }
        }
        print("---- Request End ----")
    }
    
    private func logResponse(data: Data) {
        print("")
        print("")
        print("---- Response Start ----")
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Response Body: \(jsonString)")
        } else {
            print("Response Body: Unable to decode response to string.")
        }
        print("---- Response End ----")
    }
}



enum APIError: LocalizedError {
    case invalidURL
    case requestFailed(Error)
    case decodingFailed(Error)
    case errorMessage(String)
    
    var errorDescription: String? {
            switch self {
            case .invalidURL:
                return "The URL is invalid."
            case .requestFailed(let error):
                return "The request failed with error: \(error.localizedDescription)"
            case .decodingFailed(let error):
                return "Failed to decode the response: \(error.localizedDescription)"
            case .errorMessage(let message):
                return message
            }
        }
}
