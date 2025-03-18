//
//  DateComponentsFormatter.swift
//
//
//  Created by Xiaofei Ge on 2024/4/16.
//

import Foundation

public extension DateComponentsFormatter {
    static var hourMinAbbr: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        var calendar = Calendar.current
        formatter.calendar = calendar
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()

    static var hourMinBrief: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        var calendar = Calendar.current
        formatter.calendar = calendar
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .brief
        return formatter
    }()

    static var hourMinuteOneUnit: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        formatter.maximumUnitCount = 1
        return formatter
    }()

    static var hourMinuteOneUnitEnglish: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.calendar?.locale = Locale(identifier: "en_US")
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        formatter.maximumUnitCount = 1
        return formatter
    }()
    
    static var dayHourMinTwoUnitsEnglish: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.calendar?.locale = Locale(identifier: "en_US")
        formatter.allowedUnits = [.day, .hour, .minute]
        formatter.unitsStyle = .abbreviated
        formatter.maximumUnitCount = 2
        return formatter
    }()

    static var dayHourMinTwoUnitsAbbr: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute]
        formatter.unitsStyle = .abbreviated
        formatter.maximumUnitCount = 2
        return formatter
    }()

    static var dayHourMinTwoUnitsBrief: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute]
        formatter.unitsStyle = .brief
        formatter.maximumUnitCount = 2
        return formatter
    }()

    static var hourOnly: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()

    static var minOnly: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
}

