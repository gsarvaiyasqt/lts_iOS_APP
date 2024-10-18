//
//  CustomCheckBox.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 16/10/24.
//

import SwiftUI

struct CustomCheckBox: View {
    @Binding var checked: Bool
    
    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .resizable()
            .frame(width: 24,height: 24)
            .foregroundColor(checked ? Color(UIColor.orange) : Color.orange)
            
        
    }
}

#Preview {
    CustomCheckBox(checked: .constant(false))
}
