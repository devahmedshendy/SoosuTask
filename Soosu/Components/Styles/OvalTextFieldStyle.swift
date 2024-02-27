//
//  OvalTextFieldStyle.swift
//  Soosu
//
//  Created by Ahmed Shendy on 27/02/2024.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .colorMultiply(.sendMessagePlaceholder)
            .foregroundColor(.messageText)
            .background(Color.white)
            .clipShape(Capsule(style: .continuous))
            .shadow(color: .accentColor.opacity(0.5), radius: 5)
    }
}
