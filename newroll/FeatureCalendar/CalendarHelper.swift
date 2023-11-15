//
//  CalendarHelper.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 15.11.2023.
//

import Foundation

struct CalendarHelper {
    
    static let calendar = Calendar(identifier: .gregorian)
    
    static func getDateScrollerString(_ date: Date) -> String {
        return date.formatted(
            .dateTime
                .month(.wide)
                .year(.defaultDigits))
    }
    
    static func plusMonth(_ date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date) ?? Date()
    }
    
    static func minusMonth(_ date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date) ?? Date()
    }
    
    static func daysInMonth(_ date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    static func dayOfMonth(_ date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    static func firstOfMonth(_ date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    static func weekDay(_ date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
    
}
