//
//  CalendarHelper.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 13.11.2023.
//

import Foundation

struct CalendarHelper {
    
    private let calendar = Calendar.current
    
    func stringDate(_ date: Date) -> String {
        return date.formatted(
            .dateTime
                .month(.wide)
                .year(.defaultDigits))
    }
    
    func minusMonth(_ date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    func plusMonth(_ date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func getDaysInMonth(_ date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func firstOfMonth(_ date: Date) -> Date {
        let components = calendar.dateComponents([.month, .year], from: date)
        return calendar.date(from: components)!
    }
}
