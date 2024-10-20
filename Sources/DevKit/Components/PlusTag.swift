//
//  PlusTag.swift
//  DevKit
//
//  Created by Xiaofei Ge on 2024/10/20.
//

import SwiftUI

public struct PlusTag: View {
    var style = PlusTagStyle.none
    var font: Font.TextStyle = .headline

    public enum PlusTagStyle {
        case none, solid
    }
    
    public init(style: PlusTagStyle = .none,
                font: Font.TextStyle = .headline) {
        self.style = style
        self.font = font
    }

    public var body: some View {
        switch style {
        case .none:
            Text("PLUS")
                .font(.system(font, weight: .heavy))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )

        case .solid:
            Text("PLUS")
                .font(.system(font, weight: .heavy))
                .foregroundStyle(.white)
                .shadow(color: .premiumShadow, radius: 5)
                .padding(.vertical, 3)
                .padding(.horizontal, 9)
                .background {
                    LinearGradient(
                        colors: [.red.opacity(0.8), .purple.opacity(0.8), .blue.opacity(0.8)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                }
                .cornerRadius(8)
        }
    }
}

#Preview {
    VStack {
        PlusTag(style: .none)
        PlusTag(style: .solid)
    }
}
