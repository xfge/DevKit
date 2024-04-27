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

public extension DateInterval {
    // 3月2日 11:20 至 17:30
    // 3月2日 11:20 至 3月3日 9:00
    var compactDateTime: String {
        DateIntervalFormatter.compactDateTime.string(from: start, to: end)
    }

    var fullDateTime: String {
        DateIntervalFormatter.fullDateTime.string(from: start, to: end)
    }

    func compactDateTime(timezone: TimeZone) -> String {
        let formatter = DateIntervalFormatter()
        formatter.timeZone = timezone
        formatter.dateTemplate = DateFormatter.is24HourFormat ? "MMMdHm" : "MMMdhm"
        return formatter.string(from: start, to: end)
    }

    // 11:20 - 17:30
    var shortTime: String {
        let calendar = Calendar.current
        let fromComponents = calendar.dateComponents([.hour, .minute, .second], from: start)
        let toComponents = calendar.dateComponents([.hour, .minute, .second], from: end)
        let fromDate = calendar.date(from: fromComponents)!
        let toDate = calendar.date(from: toComponents)!
        return DateIntervalFormatter.shortTime.string(from: fromDate, to: toDate)
    }

    // 3月2日至3月7日
    var shortDate: String {
        DateIntervalFormatter.shortDate.string(from: start, to: end)
    }

    func shortDate(in timeZone: TimeZone) -> String {
        let formatter = DateIntervalFormatter()
        formatter.dateTemplate = "MMMd"
        formatter.timeZone = timeZone
        return formatter.string(from: start, to: end)
    }

    var shortDateTime: String {
        DateIntervalFormatter.shortDateTime.string(from: start, to: end)
    }

    // 2023年3月2日至3月7日
    var fullDate: String {
        DateIntervalFormatter.fullDate.string(from: start, to: end)
    }
    
    // 3月2日 周一 至 3月7日 周六
    var mde: String {
        DateIntervalFormatter.mde.string(from: start, to: end)
    }

    // 2023年6月（用于旅程概要）
    var yearMonth: String {
        DateIntervalFormatter.yearMonth.string(from: start, to: end)
    }

    var midDate: Date {
        Calendar.current.date(byAdding: .second, value: Int(duration / 2.0), to: start)!
    }

    // pass midnight. e.g. Oct 29 23:00 and Oct 30 1:00 --> 1 day
    var daysBetween: Int? {
        return end.days(from: start)
    }

    var dailyIntervals: [DateInterval] {
        var dailyIntervals: [DateInterval] = []
        let calendar = Calendar.current
        calendar.enumerateDates(startingAfter: calendar.date(byAdding: .second, value: -1, to: start)!, matching: DateComponents(hour: 0, minute: 0, second: 0), matchingPolicy: .nextTime) { result, _, stop in
            if let date = result {
                if date >= end || date.isInTheFuture {
                    stop = true
                } else {
                    dailyIntervals.append(date.dayInterval)
                }
            }
        }
        return dailyIntervals
    }
}
