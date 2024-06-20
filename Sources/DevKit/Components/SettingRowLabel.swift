//
//  SettingRowLabel.swift
//
//
//  Created by Xiaofei Ge on 2024/6/20.
//

import SwiftUI

struct SettingRowLabel: View {
    var label: String
    var symbol: String

    var body: some View {
        Label(
            title: { Text(label) },
            icon: {
                Image(systemName: symbol)
                    .font(.labelFont)
            }
        )
    }
}

#Preview {
    SettingRowLabel(label: "Tags", symbol: "tag")
}
