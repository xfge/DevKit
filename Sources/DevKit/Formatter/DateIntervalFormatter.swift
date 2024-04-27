//
//  DateIntervalFormatter.swift
//
//
//  Created by Xiaofei Ge on 2024/4/16.
//

import Foundation

public extension DateIntervalFormatter {
    static var shared: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        return formatter
    }()

    static var shortTime: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()

    static var shortDate: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateTemplate = "MMMd"
        return formatter
    }()

    static var shortDateTime: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()

    static var fullDate: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateTemplate = "yyyyMMMd"
        return formatter
    }()
    
    static var mde: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateTemplate = "MMMdE"
        return formatter
    }()

    static var compactDateTime: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateTemplate = DateFormatter.is24HourFormat ? "MMMdHm" : "MMMdhm"
        return formatter
    }()

    static var fullDateTime: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateTemplate = DateFormatter.is24HourFormat ? "yyyyMMMdHm" : "yyyyMMMdhm"
        return formatter
    }()

    static var yearMonth: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateTemplate = "yyyyMMM"
        return formatter
    }()
}
