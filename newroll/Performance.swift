//
//  Week.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 08.11.2023.
//

import Foundation

enum ShiftOption: String {
    case AllDayOneRouteNoRegion = "AllDayOneRouteNoRegion"
    case AllDayOneRouteWithRegion = "AllDayOneRouteWithRegion"
    
    case PmTwoRouteNoRegion = "PmTwoRouteNoRegion"
    
    case PmOneRouteWithRegion = "PmOneRouteWithRegion"
    case PmOneRouteNoRegion = "PmOneRouteNoRegion"
    
}

struct Performance {
    
    var shifts: [Shift] = []
    
    var totalEarnPerWeek: Int {
        var total = 0
        
        // Print day earn
        var dayEarn: [Int] = []
        
        
        for shift in shifts {
            total += shift.totalShiftEarn
            
            dayEarn.append(shift.totalShiftEarn) // print
            
            
            
        }
        print(dayEarn) // print
        
        return total
    }
        
    mutating func weekPerformance(isOnlyOneRoute: Bool, allDay: Bool) {
        
        let possibleOption = [1, 3, 4, 6]
        
        for i in 1...7 {
            let allPossibleShift = getSchifts(index: i, isOnlyOneRoute: isOnlyOneRoute)
            if isOnlyOneRoute && allDay {
                if possibleOption.contains(where: {$0 == i}) {
                    if let shift = allPossibleShift[ShiftOption.AllDayOneRouteNoRegion.rawValue] {
                        shifts.append(shift)
                    }
                } else {
                    if let shift = allPossibleShift[ShiftOption.AllDayOneRouteWithRegion.rawValue] {
                        shifts.append(shift)
                    }
                }
            } else if !isOnlyOneRoute && !allDay {
                if possibleOption.contains(where: {$0 == i}) {
                    if let shift = allPossibleShift[ShiftOption.PmTwoRouteNoRegion.rawValue] {
                        shifts.append(shift)
                    }
                } else {
                    if let shift = allPossibleShift[ShiftOption.PmOneRouteWithRegion.rawValue] {
                        shifts.append(shift)
                    }
                }
            } else {
                
                if possibleOption.contains(where: {$0 == i}) {
                    if let shift = allPossibleShift[ShiftOption.PmOneRouteNoRegion.rawValue] {
                        shifts.append(shift)
                    }
                } else {
                    if let shift = allPossibleShift[ShiftOption.PmOneRouteWithRegion.rawValue] {
                        shifts.append(shift)
                    }
                }
            }
        }
    }
    
    func getSchifts(index: Int, isOnlyOneRoute: Bool) -> [String : Shift] {
        let shiftsOption: [String : Shift] = [
            ShiftOption.AllDayOneRouteNoRegion.rawValue : Shift(
                routes: [
                    Route(isAM: true, dayInWeek: index, ordersPerRoute: 13, hasRegion: false),
                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: false)],
                isOnlyOneRoute: isOnlyOneRoute),
            
            ShiftOption.AllDayOneRouteWithRegion.rawValue : Shift(
                routes: [
                    Route(isAM: true, dayInWeek: index, ordersPerRoute: 13, hasRegion: true),
                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: false)],
                isOnlyOneRoute: isOnlyOneRoute),
            
            ShiftOption.PmOneRouteWithRegion.rawValue : Shift(
                routes: [
                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: true)],
                isOnlyOneRoute: isOnlyOneRoute),
            
            ShiftOption.PmOneRouteNoRegion.rawValue : Shift(
                routes: [
                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: false)],
                isOnlyOneRoute: isOnlyOneRoute),
            
            ShiftOption.PmTwoRouteNoRegion.rawValue : Shift(
                routes: [
                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: false),
                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: false)],
                isOnlyOneRoute: isOnlyOneRoute)
        ]
        return shiftsOption
    }
}
