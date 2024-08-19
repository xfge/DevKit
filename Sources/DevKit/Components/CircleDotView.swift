//
//  CircleDotView.swift
//
//
//  Created by Xiaofei Ge on 2024/8/19.
//

import SwiftUI

public struct CircleDotView: View {
    @ScaledMetric var iconSize: Double

    public init(iconSize: Double = 7) {
        _iconSize = ScaledMetric(wrappedValue: iconSize)
    }

    public var body: some View {
        Image(systemSymbol: .circleFill)
            .font(.system(size: iconSize))
    }
}

#Preview {
    CircleDotView()
}
