//
//  SectionHeader.swift
//
//
//  Created by Xiaofei Ge on 2024/7/16.
//

import SwiftUI

public struct SectionHeader<MoreView: View>: View {
    var title: String
    var font: Font
    var vPadding: CGFloat
    @ViewBuilder var more: () -> MoreView

    public init(title: String,
                font: Font = .title3,
                vPadding: CGFloat = 8,
                @ViewBuilder more: @escaping () -> MoreView) {
        self.title = title
        self.font = font
        self.vPadding = vPadding
        self.more = more
    }

    public var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary)
                .font(font.bold())
            Spacer()
            more()
        }
        .textCase(.none)
        .padding(EdgeInsets(top: vPadding, leading: 2, bottom: vPadding, trailing: 2))
        .listRowInsets(EdgeInsets())
    }
}

public extension SectionHeader<EmptyView> {
    init(title: String, font: Font = .title3, vPadding: CGFloat = 8) {
        self.title = title
        self.font = font
        self.vPadding = vPadding
        more = { EmptyView() }
    }
}

#Preview {
    SectionHeader(title: "Title")
}
