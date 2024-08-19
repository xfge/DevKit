//
//  SectionHeader.swift
//
//
//  Created by Xiaofei Ge on 2024/7/16.
//

import SwiftUI

public struct SectionHeader<MoreView: View>: View {
    var title: String
    var vPadding: CGFloat = 8
    @ViewBuilder var more: () -> MoreView
    
    public init(title: String, 
                vPadding: CGFloat = 8,
                @ViewBuilder more: @escaping () -> MoreView) {
        self.title = title
        self.vPadding = vPadding
        self.more = more
    }

    public var body: some View {
        HStack {
            Text(title)
                .bold()
                .foregroundColor(.primary)
                .font(.title3)
            Spacer()
            more()
        }
        .textCase(.none)
        .padding(EdgeInsets(top: vPadding, leading: 2, bottom: vPadding, trailing: 2))
        .listRowInsets(EdgeInsets())
    }
}

public extension SectionHeader<EmptyView> {
    init(title: String) {
        self.title = title
        more = { EmptyView() }
    }
}

#Preview {
    SectionHeader(title: "Title")
}
