//
//  RouteManager.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 28/10/24.
//
 
import SwiftUI

struct RouteManager {
    static func view(for destination : Route.Destination) -> some View {
        switch destination {
            
        case .loginPage:
            return AnyView(LoginView().navigationBarBackButtonHidden(true))
            
        case .signUpPage:
            return AnyView(SignUpPage().navigationBarBackButtonHidden(true))
            
        case.forgotPage:
            return AnyView(ForgotPassView().navigationBarBackButtonHidden(false))
            
        case .mainTabPage:
            return AnyView(MainTabview().navigationBarBackButtonHidden(true))
            
        case .homeScreen:
            return AnyView(HomeScreen().navigationBarBackButtonHidden(true))
            
        case .homeDetail(let viewModel):
            return AnyView(HomeDetailView(viewModel: viewModel).navigationBarBackButtonHidden(false))
                        
        case .ChannelViewPage:
            return AnyView(ChannelViewPage().navigationBarBackButtonHidden(true))
            
        case .profileDetailPage:
            return AnyView(ProfileDetailsView().navigationBarBackButtonHidden(true))
            
        case .profileEditPage:
            return AnyView(ProfileEditPage().navigationBarBackButtonHidden(true))
            
        }
      }
    }
