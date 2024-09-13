//
//  UIDevice.swift
//  DevKit
//
//  Created by Xiaofei Ge on 2024/9/13.
//

import SwiftUI

public extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
