//
//  ColorfulSettingRowView.swift
//
//
//  Created by Xiaofei Ge on 2024/6/20.
//

import SFSafeSymbols
import SwiftUI

public struct ColorfulSettingRowView: View {
    var label: String
    var symbol: SFSymbol
    var color: Color
    var showUpdateDot: Bool
    var trailingSymbol: SFSymbol?

    public init(label: String,
                symbol: SFSymbol,
                color: Color = .gray,
                showUpdateDot: Bool = false,
                trailingSymbol: SFSymbol? = nil) {
        self.label = label
        self.symbol = symbol
        self.color = color
        self.showUpdateDot = showUpdateDot
        self.trailingSymbol = trailingSymbol
    }

    public var body: some View {
        HStack {
            HStack(spacing: 16) {
                iconView
                Text(label)
            }
            if showUpdateDot {
                CircleDotView()
                    .foregroundColor(.accentColor)
            }
            Spacer(minLength: 0)
            if let trailingSymbol {
                Image(systemSymbol: trailingSymbol)
                    .foregroundStyle(Color(uiColor: .systemGray2))
            }
        }
        .contentShape(.rect)
    }

    private let iconSize: CGFloat = 16
    private let boxSize: CGFloat = 28
    private let corner: CGFloat = 7

    private var iconView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: corner, style: .continuous)
                .fill(color.gradient)
                .frame(width: boxSize, height: boxSize)
            Image(systemSymbol: symbol)
                .symbolRenderingMode(.monochrome)
                .font(.system(size: iconSize, weight: .regular))
                .foregroundStyle(.white)
        }
        .accessibilityHidden(true)
    }
}

#Preview {
    Form {
        ColorfulSettingRowView(
            label: "Tags",
            symbol: .tagFill,
            color: .blue,
            showUpdateDot: true
        )
        ColorfulSettingRowView(
            label: "Sleep Data",
            symbol: .moonZzzFill,
            color: .gray,
            showUpdateDot: true
        )
    }
}
