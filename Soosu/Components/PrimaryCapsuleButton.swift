//
//  PrimaryCapsuleButton.swift
//  Soosu
//
//  Created by Ahmed Shendy on 26/02/2024.
//

import SwiftUI

struct PrimaryCapsuleButton<Label: View>: View {
    private let action: () -> Void
    private var labelBuilder: () -> Label
    
    init(
        action: @escaping () -> Void,
        @ViewBuilder labelBuilder: @escaping () -> Label
    ) {
        self.action = action
        self.labelBuilder = labelBuilder
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            labelBuilder()
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 35)
        .foregroundColor(.white)
        .background(
            Capsule(style: .continuous)
                .foregroundColor(.accentColor)
        )
    }
}
