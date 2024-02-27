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
    @State var messages = SessionMessage.samples
    
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
                    .padding(.bottom, 150)
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
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.system(.largeTitle).weight(.light))
            }
            .padding(20)
            .accentColor(.black)
        }
        .ignoresSafeArea(edges: [.horizontal, .bottom])
    }
}

#Preview {
    SessionView()
}
