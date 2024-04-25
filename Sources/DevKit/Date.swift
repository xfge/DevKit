//
//  Date.swift
//
//
//  Created by Xiaofei Ge on 2024/4/16.
//

import Foundation

public extension Date {
    func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }

    func isInSameYear(as date: Date) -> Bool { isEqual(to: date, toGranularity: .year) }
    func isInSameMonth(as date: Date) -> Bool { isEqual(to: date, toGranularity: .month) }
    func isInSameWeek(as date: Date) -> Bool { isEqual(to: date, toGranularity: .weekOfYear) }

    func isInSameDay(as date: Date) -> Bool { Calendar.current.isDate(self, inSameDayAs: date) }

    var isInThisYear:  Bool { isInSameYear(as: Date()) }
    var isInThisMonth: Bool { isInSameMonth(as: Date()) }
    var isInThisWeek:  Bool { isInSameWeek(as: Date()) }

    var isInYesterday: Bool { Calendar.current.isDateInYesterday(self) }
    var isInToday:     Bool { Calendar.current.isDateInToday(self) }
    var isInTomorrow:  Bool { Calendar.current.isDateInTomorrow(self) }

    var isInTheFuture: Bool { self > Date() }
    var isInThePast:   Bool { self < Date() }
    
    var isValid:            Bool { self != .distantPast && self != .distantFuture }
    var isDistantPast:      Bool { self == .distantPast }
    var isDistantFuture:    Bool { self == .distantFuture }
}

public extension Date {
    static let secondsOfAnHour: TimeInterval = 3600
    static let secondsOfADay: TimeInterval = 86400

    // 12:00
    var shortTime: String {
        DateFormatter.shortTime.string(from: self)
    }

    // 1/1/2022
    var shortDate: String {
        DateFormatter.shortDate.string(from: self)
    }

    // 1/1/2022 12:00
    var shortDateTime: String {
        DateFormatter.shortDateTime.string(from: self)
    }

    // MMMd jm
    var compactDateTime: String {
        DateFormatter.compactDateTime.string(from: self)
    }

    // 1天前，1星期前
    func relative(to date: Date) -> String {
        RelativeDateTimeFormatter.relative.localizedString(for: self, relativeTo: date)
    }

    // 1天前，1星期前
    var gapRelativeToToday: String {
        relative(to: .now)
    }

    var weekday: String {
        DateFormatter.weekday.string(from: self)
    }

    // 1月1日 周一
    var dateWeekday: String {
        DateFormatter.dateWeekday.string(from: self)
    }

    // 2022年1月1日 周一
    var fullDateWeekday: String {
        DateFormatter.fullDateWeekday.string(from: self)
    }

    // 昨天下午 1:00
    var relativeDateTime: String {
        DateFormatter.relative.string(from: self)
    }

    // 12:00 -> 12月1日 -> 2022年12月1日
    var flexibleDateTime: String {
        if isInToday {
            return shortTime
        } else if isInThisYear {
            return DateFormatter.monthDay.string(from: self)
        } else {
            return shortDate
        }
    }

    var ymde: String {
        DateFormatter.ymde.string(from: self)
    }

    var ymd: String {
        DateFormatter.ymd.string(from: self)
    }

    var mde: String {
        DateFormatter.mde.string(from: self)
    }

    var md: String {
        DateFormatter.md.string(from: self)
    }
    
    var relativeDateOnly: String {
        DateFormatter.relativeDateOnly.string(from: self)
    }

    // 今日, 3月1日 周三, 2021年3月1日 周四
    func flexibleDate(weekday: Bool = false, year: Bool = true, showTimeForRelativeDate: Bool = false) -> String {
        let relative = DateFormatter.relativeDateOnly.string(from: self)
        let absolute = DateFormatter.absoluteDateOnly.string(from: self)

        if relative == absolute {
            if weekday {
                return isInThisYear || !year ? mde : ymde
            } else {
                return isInThisYear || !year ? md : ymd
            }
        } else {
            if showTimeForRelativeDate && (isInToday || isInYesterday) {
                return DateFormatter.relative.string(from: self)
            } else {
                return relative.capitalized
            }
        }
    }

    // Same day: 12:00, Different day: 3月1日 12:00
    func compactDateTime(relativeTo date: Date) -> String {
        isInSameDay(as: date) ? shortTime : compactDateTime
    }

    // The weekday units are the numbers 1 through N (where for the Gregorian calendar N=7 and 1 is Sunday). It also respects the user settings.
    var dayOfWeek: Int {
        Calendar.current.component(.weekday, from: self)
    }

    // pass midnight. e.g. Oct 29 23:00 and Oct 30 1:00 --> 1 day
    func days(from date: Date) -> Int? {
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: date)
        let end = calendar.startOfDay(for: self)
        return calendar.dateComponents([.day], from: start, to: end).day
    }

    func weeks(from date: Date) -> Int? {
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: date)
        let end = calendar.startOfDay(for: self)
        return calendar.dateComponents([.weekOfYear], from: start, to: end).weekOfYear
    }

    // 3:00 ~ 4:00
    var hourInterval: DateInterval {
        Calendar.current.dateInterval(of: .hour, for: self)!
    }

    // 3/2 0:00 ~ 3/3 0:00
    var dayInterval: DateInterval {
        Calendar.current.dateInterval(of: .day, for: self)!
    }

    // Sunday 0:00 ~ next Sunday 0:00
    var weekInterval: DateInterval {
        Calendar.current.dateInterval(of: .weekOfMonth, for: self)!
    }

    // Sun 0:00, Mon 0:00, ..., Sat 0:00 where the first day depends on the user settings
    var weekDays: [Date] {
        (0 ..< 7).map { Calendar.current.date(byAdding: .day, value: $0, to: weekInterval.start)! }
    }

    // 3/1 0:00 ~ 4/1 0:00
    var monthInterval: DateInterval {
        Calendar.current.dateInterval(of: .month, for: self)!
    }

    // 30/31
    var daysOfMonth: Int {
        Calendar.current.dateComponents([.day], from: monthInterval.start, to: monthInterval.end).day!
    }

    // 1 ~ 30/31
    var dayOfMonth: Int {
        Calendar.current.component(.day, from: self)
    }

    // 0a 6a 12p 6p, or: 0 6 12 18
    var hourOnly: String {
        if DateFormatter.is24HourFormat {
            return DateFormatter.hour.string(from: self)
        } else {
            return DateFormatter.hourAmPm.string(from: self).replacing("M", with: "").lowercased()
        }
    }

    // Jan Feb
    var month: String {
        DateFormatter.month.string(from: self)
    }
    
    // January February
    var fullMonth: String {
        DateFormatter.fullMonth.string(from: self)
    }

    // 3月2日
    var monthDay: String {
        DateFormatter.monthDay.string(from: self)
    }

    // 2022年5月
    var yearMonth: String {
        DateFormatter.yearMonth.string(from: self)
    }

    // 2022年
    var year: String {
        DateFormatter.year.string(from: self)
    }

    // 3月1日 09:41
    var mdejm: String {
        DateFormatter.mdejm.string(from: self)
    }

    // Returns the first moment, as a Date, 0:00.
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }

    var nextMidnight: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!
    }

    // Returns the first moment of the week.
    var startOfWeek: Date {
        Calendar.current.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date!
    }

    // Returns the first moment of the month.
    var startOfMonth: Date {
        Calendar.current.dateComponents([.calendar, .year, .month], from: self).date!
    }

    // Returns the first moment of the year.
    var startOfYear: Date {
        Calendar.current.dateComponents([.calendar, .year], from: self).date!
    }

    var sevenDaysAgo: Date {
        Calendar.current.date(byAdding: .day, value: -6, to: startOfDay)!
    }

    var past7Days: DateInterval {
        DateInterval(safeStart: sevenDaysAgo, end: self)
    }

    // Start of day of 30d ago
    var thirtyDaysAgo: Date {
        Calendar.current.date(byAdding: .day, value: -29, to: startOfDay)!
    }

    var past30Days: DateInterval {
        DateInterval(safeStart: thirtyDaysAgo, end: self)
    }

    var secondsOfDay: TimeInterval {
        timeIntervalSince(startOfDay)
    }

    // e.g. If 4 a.m. as the split timestamp, use 72000 = 86400 - 3600 * 4
    func getSecondsOfDay(offset: Double) -> Double {
        (secondsOfDay + offset).truncatingRemainder(dividingBy: 86400)
    }

    func shortTime(in timeZone: TimeZone) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
}

extension Date {
    init(month: Int, day: Int, year: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        var dateComponents = DateComponents()
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.year = year
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.timeZone = .current
        dateComponents.calendar = .current
        self = Calendar.current.date(from: dateComponents) ?? Date()
    }
}
