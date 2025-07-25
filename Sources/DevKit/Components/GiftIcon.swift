//
//  GiftIcon.swift
//  DevKit
//
//  Created by Xiaofei Ge on 2025/7/25.
//

import SwiftUI

public struct GiftIcon: View {
    @State private var isBreathing = false

    public var body: some View {
        Text("🎁")
            .scaleEffect(isBreathing ? 1.1 : 0.8)
            .animation(
                .easeInOut(duration: 1.5)
                    .repeatForever(autoreverses: true),
                value: isBreathing
            )
            .onAppear {
                isBreathing = true
            }
    }
}

#Preview {
    GiftIcon()
}
