//
//  SessionModeToggle.swift
//  Soosu
//
//  Created by Ahmed Shendy on 27/02/2024.
//

import SwiftUI

struct SessionModeToggle: View {
    @State private var selection: Int = 0
    
    private let onChatModeEnabled: () -> Void
    private let onVoiceModeEnabled: () -> Void
    
    init(
        onChatModeEnabled: @escaping () -> Void,
        onVoiceModeEnabled: @escaping () -> Void
    ) {
        self.onChatModeEnabled = onChatModeEnabled
        self.onVoiceModeEnabled = onVoiceModeEnabled
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Group {
                ZStack {
                    Rectangle()
                        .fill(selection == 0 ? .messageText : .white)
                        .clipShape(Capsule(style: .continuous))
                        .onTapGesture {
                            withAnimation(.interactiveSpring()) {
                                selection = 0
                            }
                        }
                }
                .overlay(
                    Label("Chat", systemImage: "message.fill")
                        .foregroundColor(selection == 0 ? .white : .messageText)
                )
                
                ZStack {
                    Rectangle()
                        .fill(selection == 1 ? .messageText : .white)
                        .clipShape(Capsule(style: .continuous))
                        .onTapGesture {
                            withAnimation(.interactiveSpring()) {
                                selection = 1
                            }
                        }
                }
                .overlay(
                    Label("Voice", systemImage: "mic.fill")
                        .foregroundColor(selection == 1 ? .white : .messageText)
                )
            }
            .padding(3)
        }
        .frame(height: 45)
        .background(Color.white)
        .clipShape(
            Capsule(style: .continuous)
        )
        .overlay(
            Capsule(style: .continuous)
                .stroke(.sendMessageBorder, lineWidth: 1.2)
        )
            
    }
}

#Preview {
    SessionModeToggle(
        onChatModeEnabled: {
            //
        },
        onVoiceModeEnabled: {
            //
        }
    )
}
