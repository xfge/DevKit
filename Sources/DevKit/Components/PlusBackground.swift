//
//  PlusBackground.swift
//  DevKit
//
//  Created by Xiaofei Ge on 2024/11/5.
//

import SwiftUI

public struct PlusBackground: View {
    let colors = [Color.mint, .purple, .orange]
    
    public init() {}

    public var body: some View {
        ZStack {
            LinearGradient(colors: colors,
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            Color.clear
                .background(.regularMaterial)
        }
    }
}
