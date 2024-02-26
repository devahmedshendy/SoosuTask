//
//  MainView.swift
//  Soosu
//
//  Created by Ahmed Shendy on 26/02/2024.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            ScreenView {
                VentView()
            }
            .tabItem {
                Label("Vent", systemImage: "house")
            }
            .tag(0)
            
            ScreenView {
                ChatView(username: "Sandy")
            }
            .tabItem {
                Label("Chat", systemImage: "message")
            }
            .tag(1)
            
            ScreenView {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
            .tag(2)
        }
        .accentColor(.accentColor)
    }
}

#Preview {
    MainView()
}
