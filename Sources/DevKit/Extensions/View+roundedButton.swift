//
//  View+roundedButton.swift
//  DevKit
//
//  Created by Xiaofei Ge on 2024/11/5.
//

import SwiftUI

public extension View {
    func roundedButton(backgroundColor: Color = .accentColor) -> some View {
        textCase(.uppercase)
            .font(.subheadline.bold())
            .padding(.horizontal)
            .padding(6)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}
