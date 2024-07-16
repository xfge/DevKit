//
//  CaptionTagView.swift
//
//
//  Created by Xiaofei Ge on 2024/7/16.
//

import SwiftUI

public struct CaptionTagView: View {
    var label: String
    var font: Font
    var textColor: Color
    var background: Color

    public init(label: String,
                font: Font = .caption2,
                textColor: Color = .secondary,
                background: Color = .captionTagBackground) {
        self.label = label
        self.font = font
        self.textColor = textColor
        self.background = background
    }

    public var body: some View {
        Text(label)
            .font(font)
            .foregroundColor(textColor)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(background)
            }
    }
}

#Preview {
    CaptionTagView(label: "Beta")
}
