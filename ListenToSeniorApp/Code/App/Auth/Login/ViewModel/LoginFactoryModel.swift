//
//  LoginFactoryModel.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 15/11/24.
//

import Foundation
final class LoginViewModelFactory {
    @MainActor
    static func createTaskViewModel() -> LoginViewModel {
        return LoginViewModel(loginRepository: LoginRepoImpl())
    }
}
