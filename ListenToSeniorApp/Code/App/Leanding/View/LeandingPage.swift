//
//  LeandingPage.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 21/10/24.
//

import SwiftUI

struct LeandingPage: View {
    
    @EnvironmentObject var router: Route
    @EnvironmentObject var leandingModel : LeandingModel
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Image("ltslogo")
                    .padding(.vertical,20)
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .tint(.white)
                    .onAppear {
                        print("\(TokenManager.shared.hasToken()) ====  token value?")
                        print("\(leandingModel.isLogin) \(leandingModel.isGuest) ====  check this model.isLogin")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            router.navigate(to: leandingModel.isLogin ? .mainTabPage : .loginPage)
                        }
                    }
            }
        }
    }
}

#Preview {
    LeandingPage()
        .environmentObject(Route())
        .environmentObject(LeandingModel())
}
