//
//  PrimaryIconButton.swift
//  Soosu
//
//  Created by Ahmed Shendy on 27/02/2024.
//

import SwiftUI

struct PrimaryIconButton: View {
    private let action: () -> Void
    private let systemName: String
    
    init(
        action: @escaping () -> Void,
        systemName: String
    ) {
        self.action = action
        self.systemName = systemName
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(Font.headline.weight(.bold))
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .clipShape(Circle())
    }
}
