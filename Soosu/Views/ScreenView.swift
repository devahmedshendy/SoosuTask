//
//  ScreenView.swift
//  Soosu
//
//  Created by Ahmed Shendy on 26/02/2024.
//

import SwiftUI

struct ScreenView<Content: View>: View {
    private let contentBuilder: () -> Content
    
    init(@ViewBuilder contentBuilder: @escaping () -> Content) {
        self.contentBuilder = contentBuilder
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [.screenBackground1, .screenBackground2]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea(edges: .all)
            
            contentBuilder()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ScreenView {
        EmptyView()
    }
}
