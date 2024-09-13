//
//  WelcomeEntryView.swift
//  DevKit
//
//  Created by Xiaofei Ge on 2024/9/13.
//

import SwiftUI
import SFSafeSymbols

public struct WelcomeEntryView: View {
    var symbol: SFSymbol
    var title: String
    var content: String
    var color: Color
    
    public init(symbol: SFSymbol, title: String, content: String, color: Color = .blue) {
        self.symbol = symbol
        self.title = title
        self.content = content
        self.color = color
    }
    
    public var body: some View {
        HStack(spacing: 12) {
            Image(systemName: symbol.rawValue)
                .font(.system(size: 30))
                .foregroundColor(color)
                .frame(width: 48)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .fontWeight(.semibold)
                    Spacer()
                }
                Text(content)
                    .foregroundColor(.secondary)
            }
            .font(.subheadline)
            .fixedSize(horizontal: false, vertical: true)

            Spacer(minLength: 2)
        }
    }
}

#Preview {
    WelcomeEntryView(symbol: .mapFill, title: "Life Tracker", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer semper nisl vitae sem facilisis, non cursus diam eleifend.")
}
