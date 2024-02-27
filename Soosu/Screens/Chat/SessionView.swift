//
//  SessionView.swift
//  Soosu
//
//  Created by Ahmed Shendy on 26/02/2024.
//

import SwiftUI
import Combine

struct SessionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var messages = SessionMessageModel.samples
    @State var message: String = ""
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack {
                        ForEach(messages) { message in
                            SessionMessageView(message)
                        }
                        EmptyView()
                            .id(messages.last)
                    }
                    .padding(.top, 75)
                    .padding(.bottom, 200)
                    .onReceive(Just(messages)) { _ in
                        withAnimation {
                            proxy.scrollTo(messages.last, anchor: .top)
                        }
                    }.onAppear {
                        withAnimation {
                            proxy.scrollTo(messages.last, anchor: .top)
                        }
                    }
                }
                .clipped()
            }
            .ignoresSafeArea(edges: [.horizontal, .bottom])
            
            VStack(alignment: .trailing) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(.largeTitle).weight(.light))
                }
                .padding(20)
                .accentColor(.black)
                
                Spacer()
                
                VStack(spacing: 20) {
                    SessionSendTextField(message: $message) {
                        // action
                    }
                    .padding(.horizontal, 25)
                    
                    SessionModeToggle(
                        onChatModeEnabled: {
                            
                        }, 
                        onVoiceModeEnabled: {
                            
                        }
                    )
                    .padding(.horizontal, 85)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        }
    }
}

#Preview {
    SessionView()
}
