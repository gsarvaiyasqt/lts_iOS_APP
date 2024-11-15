//
//  ListenToSeniorApp.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 16/10/24.
//

import SwiftUI

@main
struct ListenToSeniorApp: App {
    
    @StateObject var route = Route()
    @StateObject var leandingModel = LeandingModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $route.navPath) {
                LeandingPage()
                    .navigationDestination(for: Route.Destination.self) { destination in
                        RouteManager.view(for: destination)
                    }
                  
            }
            .environmentObject(route)
            .environmentObject(leandingModel)
        }
        
    }
}
