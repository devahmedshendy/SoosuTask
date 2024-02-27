//
//  SessionSendTextField.swift
//  Soosu
//
//  Created by Ahmed Shendy on 27/02/2024.
//

import SwiftUI

struct SessionSendTextField: View {
    @Binding var message: String
    
    private let action: () -> Void
    
    init(message: Binding<String>, action: @escaping () -> Void) {
        self._message = message
        self.action = action
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("I've been thinking today that...", text: $message)
                .font(.headline.weight(.medium))
                .textFieldStyle(OvalTextFieldStyle())
            
            PrimaryIconButton(
                action: action,
                systemName: "chevron.forward"
            )
            .padding(.trailing, 5)
        }
    }
}

#Preview {
    SessionSendTextField(
        message: .constant("Type message..."),
        action: {
            //
        }
    )
}
