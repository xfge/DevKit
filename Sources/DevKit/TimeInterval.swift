//
//  TimeInterval.swift
//
//
//  Created by Xiaofei Ge on 2024/4/16.
//

import Foundation

public extension TimeInterval {
    // 19h 31m
    var hourMinAbbr: String {
        DateComponentsFormatter.hourMinAbbr.string(from: roundedToNearestThirtySeconds)!
    }

    var hourMin: String {
        DateComponentsFormatter.hourMinBrief.string(from: roundedToNearestThirtySeconds)!
    }

    // 40h or 35m
    var hourOrMin: String {
        DateComponentsFormatter.hourMinuteOneUnit.string(from: roundedToNearestThirtySeconds) ?? ""
    }

    var hourOrMinEnglish: String {
        DateComponentsFormatter.hourMinuteOneUnitEnglish.string(from: roundedToNearestThirtySeconds) ?? ""
    }

    var twoUnitsEnglish: String {
        DateComponentsFormatter.dayHourMinTwoUnitsEnglish.string(from: roundedToNearestThirtySeconds)!
    }

    // 1d 18h or 19h 31m
    var twoUnitsAbbr: String {
        DateComponentsFormatter.dayHourMinTwoUnitsAbbr.string(from: roundedToNearestThirtySeconds)!
    }

    // 1day 18hr or 19hr 31min
    var twoUnits: String {
        DateComponentsFormatter.dayHourMinTwoUnitsBrief.string(from: roundedToNearestThirtySeconds)!
    }

    // 2h
    var hourOnly: String {
        DateComponentsFormatter.hourOnly.string(from: self) ?? ""
    }

    // 12m
    var minOnly: String {
        DateComponentsFormatter.minOnly.string(from: roundedToNearestThirtySeconds) ?? ""
    }

    var roundedToNearestThirtySeconds: TimeInterval {
        guard self > 0 else { return 0 }
        let seconds = truncatingRemainder(dividingBy: 60)
        let rounded = self - seconds + (seconds / 30).rounded() * 30
        return max(rounded, 60)
    }
}
