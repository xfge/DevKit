//
//  CaptionTagView.swift
//
//
//  Created by Xiaofei Ge on 2024/7/16.
//

import SwiftUI

public struct CaptionTagView: View {
    var label: String
    var textColor: Color = .secondary
    var background: Color = .captionTagBackground

    public init(label: String,
                textColor: Color = .secondary,
                background: Color = .captionTagBackground) {
        self.label = label
        self.textColor = textColor
        self.background = background
    }

    public var body: some View {
        Text(label)
            .font(.caption2)
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
