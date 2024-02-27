//
//  ChatView.swift
//  Soosu
//
//  Created by Ahmed Shendy on 26/02/2024.
//

import SwiftUI

struct ChatView: View {
    @State private var showingSession = false
    
    var username: String
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            VStack(spacing: 0) {
                Text("\(.text.ChatViewTitle),")
                    .font(.largeTitle)
                Text("\(username)!")
                    .font(.title)
                    .fontWeight(.black)
            }
            
            Text(verbatim: .text.ChatViewDescription)
                .multilineTextAlignment(.center)
            
            PrimaryCapsuleButton {
                showingSession = true
            } labelBuilder: {
                Text(verbatim: .text.StartSession.uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
            }
            
            ForEach(0..<5) { _ in
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $showingSession) {
            ScreenView {
                SessionView()
            }
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    ChatView(username: "Shendy")
}
