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
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack {
                            ForEach(messages) { message in
                                SessionMessageView(message)
                                    .id(message)
                            }
                        }
                        .padding(.top, 100)
                        .onReceive(Just(messages)) { _ in
                            withAnimation {
                                proxy.scrollTo(messages.last, anchor: .bottom)
                            }
                            
                        }.onAppear {
                            withAnimation {
                                proxy.scrollTo(messages.last, anchor: .bottom)
                            }
                        }
                    }
                }
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
    }
}

#Preview {
    SessionView()
}
