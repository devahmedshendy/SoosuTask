//
//  ChatView.swift
//  Soosu
//
//  Created by Ahmed Shendy on 26/02/2024.
//

import SwiftUI

struct ChatView: View {
    @State private var showingSession = false
    @State var sessions = SessionModel.samples
    
    var username: String
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Spacer()
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
                .padding(.horizontal, 75)
            
            PrimaryCapsuleButton {
                showingSession = true
            } labelBuilder: {
                Text(verbatim: .text.StartSession.uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
            }
            
            Spacer()
            Spacer()
            
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    Text(verbatim: .text.PreviewSessions)
                        .font(.title3.weight(.bold))
                    Text("Lorem ipsum dolor sit amet")
                        .font(.subheadline)
                }
                .padding(.horizontal, 40)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 20) {
                        ForEach(sessions) { session in
                            SessionCard(session)
                                .frame(
                                    width: geo.size.width * 0.59,
                                    height: geo.size.width * 0.59 * 0.66
                                )
                        }
                    }
                    .padding(.horizontal, 40)
                }
            }
        }
        .fullScreenCover(isPresented: $showingSession) {
            ScreenView {
                SessionView()
            }
        }
    }
}

#Preview {
    ChatView(username: "Shendy")
}
