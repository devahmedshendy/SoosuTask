//
//  SessionMessageView.swift
//  Soosu
//
//  Created by Ahmed Shendy on 26/02/2024.
//

import SwiftUI

struct SessionMessageView: View {
    private let isRecipient: Bool
    private let content: String
    
    init(_ message: SessionMessage) {
        self.isRecipient = message.isRecipient
        self.content = message.content
    }
    
    var body: some View {
        Text(content)
            .padding(10)
            .foregroundColor(.black)
            .background(
                isRecipient ? Color.recipientBackground : Color.senderBackground
            )
            .cornerRadius(10)
            .padding(.vertical, 5)
            .padding(.leading, isRecipient ? 15 : 60)
            .padding(.trailing, isRecipient ? 60 : 15)
    }
}

#Preview {
    VStack {
        SessionMessageView(
            .init(
                isRecipient: false,
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
            )
        )
        
        SessionMessageView(
            .init(
                isRecipient: true,
                content: "Hello, Sandy. I'm glad we can spend some time together today. How are you feeling at this moment?"
            )
        )
    }
    .frame(width: .infinity, height: 400)
}
