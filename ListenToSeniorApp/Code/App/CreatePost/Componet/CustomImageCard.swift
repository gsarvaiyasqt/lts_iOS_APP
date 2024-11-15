//
//  CustomImageCard.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 07/11/24.
//

import SwiftUI

struct CustomImageCard: View {
    
    var body: some View {
        Image(systemName: "photo")
               .resizable()
               .frame(width: 28, height:  24)
               .foregroundColor(.gray.opacity(0.8))
               .padding(.all,50)
               .clipShape(
                      RoundedRectangle(cornerRadius: 15)
                  )
                  .overlay {
                      RoundedRectangle(cornerRadius: 15)
                          .strokeBorder(Color.orange, lineWidth: 2)
                  }
                  .padding(.bottom, 20)
    }
}

#Preview {
    CustomImageCard()
}
