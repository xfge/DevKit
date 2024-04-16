//
//  DateInterval.swift
//
//
//  Created by Xiaofei Ge on 2024/4/16.
//

import Foundation

public extension DateInterval {
    init(safeStart start: Date, end: Date) {
        if end < start {
            self.init(start: start, end: start)
        } else {
            self.init(start: start, end: end)
        }
    }
}
