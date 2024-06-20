//
//  SettingRowLabel.swift
//
//
//  Created by Xiaofei Ge on 2024/6/20.
//

import SFSafeSymbols
import SwiftUI

public struct SettingRowLabel: View {
    var label: String
    var symbol: SFSymbol

    public var body: some View {
        Label(
            title: { Text(label) },
            icon: {
                Image(systemSymbol: symbol)
                    .font(.labelFont)
            }
        )
    }
}

#Preview {
    SettingRowLabel(label: "Tags", symbol: .tag)
}
