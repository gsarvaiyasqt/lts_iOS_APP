//
//  LoginRepo.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 15/11/24.
//

import Foundation


protocol LoginRepository {
    func signInCall(loginReqModel : LoginReqModel) async throws -> LoginResponseModel
}


final class LoginRepoImpl : LoginRepository {
        
    func signInCall(loginReqModel: LoginReqModel) async throws -> LoginResponseModel {
        
        do {
            let response = try await WebService.shared.request(
                url: ApiConfig.loginEndpoint(),
                body: loginReqModel,
                responseType: LoginResponseModel.self
            )
            
            print("\(response) ===== check repo response")
            
            if response.status == 1 {
                
                if let token = response.data.token {
                    TokenManager.shared.saveToken(token)
                }
                return response
                
                
                print("\(response) ===== check repo response status 1")
                
            } else {
                
                throw APIError.errorMessage(response.message)
            }
            
        } catch {
            throw APIError.requestFailed(error)
        }
        
    }
}

