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
}
