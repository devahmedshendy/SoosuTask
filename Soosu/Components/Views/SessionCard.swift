//
//  SessionCard.swift
//  Soosu
//
//  Created by Ahmed Shendy on 27/02/2024.
//

import SwiftUI

struct SessionCard: View {
    let session: SessionModel
    
    init(_ session: SessionModel) {
        self.session = session
    }
    
    private let colors = [
        Color(UIColor(red: 242/255, green: 232/255, blue: 178/255, alpha: 1.0)),
        Color(UIColor(red: 242/255, green: 232/255, blue: 178/255, alpha: 1.0)),
        Color(UIColor(red: 113/255, green: 188/255, blue: 241/255, alpha: 1.0)),
        Color(UIColor(red: 113/255, green: 188/255, blue: 241/255, alpha: 1.0)),
        Color(UIColor(red: 255/255, green: 251/255, blue: 221/255, alpha: 1.0)),
        Color(UIColor(red: 255/255, green: 251/255, blue: 221/255, alpha: 1.0)),
        Color(UIColor(red: 255/255, green: 251/255, blue: 221/255, alpha: 1.0)),
        Color(UIColor(red: 255/255, green: 251/255, blue: 221/255, alpha: 1.0)),
    ]
    
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                Text(session.title)
                    .font(.headline)
                Text(session.date)
                    .font(.subheadline)
            }
        }
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(
                    RadialGradient(
                        colors: colors,
                        center: .init(x: 0.85, y: 1.2),
                        startRadius: 0,
                        endRadius: 270
                    )
                )
        )
        .clipped()
        .shadow(color: .accentColor.opacity(0.25), radius: 10)
    }
}

#Preview {
    SessionCard(.init(title: "Session Title", date: "Session Date"))
}
