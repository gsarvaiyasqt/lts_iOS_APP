//
//  LoginViewModel .swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 13/11/24.
//

//    func loginApi(loginReqModel : LoginReqModel) async{
//        print("Api calling 2")
//        isLoding = true
//        do{
//            print("Api calling 3")
//            self.loginResModel = try await WebService.getLoginApi(loginRequestModel: LoginReqModel(username: loginReqModel.username, password: loginReqModel.password))
//            isLoding = false
//
//        }catch (let error) {
//            loginError = APIError.decodingFailed(error)
//            print("\(error) === login catch error")
//            shouldShowAlert = true
//            isLoding = false
//        }
//    }

import Foundation

@MainActor
final class LoginViewModel: ObservableObject{
    
    @Published var loginResModel : LoginResponseModel?
    @Published var isLoading = false
    @Published var shouldShowAlert = false
    @Published var loginError : APIError?
    
    
    private let loginRepository: LoginRepository
    
    init(loginRepository: LoginRepository){
        self.loginRepository = loginRepository
    }
    
    func signIn(loginReqModel: LoginReqModel) async{
        
        isLoading = true
        
        do{
            print("Api call 1")
            self.loginResModel = try await loginRepository.signInCall(loginReqModel: loginReqModel)
            
            print("\(String(describing: self.loginResModel?.data))")
        
            isLoading = false
            
        }catch let error as APIError {
            
            loginError = error
            shouldShowAlert = true
            isLoading = false
            
        } catch {
            loginError = APIError.requestFailed(error)
            shouldShowAlert = true
            isLoading = false
        }
    }
    
}
