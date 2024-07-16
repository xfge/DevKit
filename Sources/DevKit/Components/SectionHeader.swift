//
//  SectionHeader.swift
//
//
//  Created by Xiaofei Ge on 2024/7/16.
//

import SwiftUI

public struct SectionHeader<MoreView: View>: View {
    var title: String
    var caption: String?
    var vPadding: CGFloat = 8
    @ViewBuilder var more: () -> MoreView

    public var body: some View {
        HStack {
            Text(title)
                .bold()
                .foregroundColor(.primary)
                .font(.title3)
            if let caption {
                CaptionTagView(label: caption)
            }
            Spacer()
            more()
        }
        .textCase(.none)
        .padding(EdgeInsets(top: vPadding, leading: 2, bottom: vPadding, trailing: 2))
        .listRowInsets(EdgeInsets())
    }
}

public extension SectionHeader<EmptyView> {
    public init(title: String) {
        self.title = title
        more = { EmptyView() }
    }
}

#Preview {
    SectionHeader(title: "Title")
}
