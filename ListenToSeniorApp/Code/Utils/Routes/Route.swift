//
//  Route.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 21/10/24.
//

import SwiftUI

class Route : ObservableObject {
    
    enum Destination: Codable, Hashable {
        case loginPage
        case signUpPage
        case forgotPage
        case mainTabPage
        case homeScreen
        case homeDetail(HomeCardViewModel)
        case ChannelViewPage
        case profileDetailPage
        case profileEditPage
        
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination)  {
        navPath.append(destination)
    }
    
    func navigateBack(){
        navPath.removeLast()
    }
    
    func navigateToRoot(){
        navPath.removeLast(navPath.count)
    }
    
}
