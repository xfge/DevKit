//
//  CircleDotView.swift
//
//
//  Created by Xiaofei Ge on 2024/8/19.
//

import SwiftUI

public struct CircleDotView: View {
    @ScaledMetric var iconSize: Double = 7.0

    public init() {}

    public var body: some View {
        Image(systemSymbol: .circleFill)
            .font(.system(size: iconSize))
    }
}

#Preview {
    CircleDotView()
}
