//
//  ColorfulSettingRowView.swift
//
//
//  Created by Xiaofei Ge on 2024/6/20.
//

import SwiftUI

struct ColorfulSettingRowView: View {
    var label: String
    var symbol: String
    var color: Color
    var trailingSymbol: String?
    
    @ScaledMetric var size = 28.0

    var body: some View {
        HStack {
            Label(label, systemImage: symbol)
                .labelStyle(ColorfulIconLabelStyle(color: color, size: size))
            Spacer(minLength: 0)
            if let trailingSymbol {
                Image(systemName: trailingSymbol)
                    .foregroundStyle(Color(uiColor: .systemGray2))
            }
        }
        .contentShape(Rectangle())
    }
}

struct ColorfulIconLabelStyle: LabelStyle {
    var color: Color
    var size: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
        } icon: {
            configuration.icon
                .font(.labelFont)
                .foregroundColor(.white)
                .frame(width: size, height: size)
                .background(color.opacity(0.9))
                .cornerRadius(6)
        }
    }
}

extension Font {
    static var labelFont: Font {
        if #available(iOS 17.0, *) {
            return .footnote
        } else {
            return .body
        }
    }
}

#Preview {
    ColorfulSettingRowView(
        label: "General",
        symbol: "tag",
        color: .gray
    )
}
