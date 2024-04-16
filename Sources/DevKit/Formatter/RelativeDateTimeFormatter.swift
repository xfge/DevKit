//
//  RelativeDateTimeFormatter.swift
//
//
//  Created by Xiaofei Ge on 2024/4/16.
//

import Foundation

public extension RelativeDateTimeFormatter {
    static var relative: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        return formatter
    }()
}
