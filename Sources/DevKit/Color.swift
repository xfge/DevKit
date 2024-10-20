//
//  Color.swift
//
//
//  Created by Xiaofei Ge on 2024/7/16.
//

import SwiftUI

public extension Color {
    static var captionTagBackground: Color {
        Color(uiColor: UIColor { $0.userInterfaceStyle == .dark ? .systemGray5 : .systemGray6 })
    }
    
    static var premiumShadow: Color {
        Color(.sRGBLinear, white: 0, opacity: 0.33).opacity(0.5)
    }
}
