////
////  Week.swift
////  newroll
////
////  Created by Tomáš Duchoslav on 08.11.2023.
////
//
//import Foundation
//
//struct Performance {
//    
//    var shifts: [Shift] = []
//    
//    var totalEarnPerWeek: Int {
//        var total = 0
//        
//        // Print day earn
//        var dayEarn: [Int] = []
//        
//        
//        for shift in shifts {
//            total += shift.totalShiftEarn
//            
//            dayEarn.append(shift.totalShiftEarn) // print
//            
//            
//            
//        }
//        print(dayEarn) // print
//        
//        return total
//    }
//    
//    mutating func weekPerformance(isOnlyOneRoute: Bool, allDay: Bool) {
//        
//        let possibleOption = [1, 3, 4, 6]
//        
//        for dayInWeek in 1...7 {
//            let allPossibleShift = getSchifts(dayInWeek: dayInWeek, isOnlyOneRoute: isOnlyOneRoute)
//            if isOnlyOneRoute && allDay {
//                if possibleOption.contains(where: {$0 == dayInWeek}) {
//                    if let shift = allPossibleShift["AllDayOneRouteNoRegion"] {
//                        shifts.append(shift)
//                    }
//                } else {
//                    if let shift = allPossibleShift["AllDayOneRouteWithRegion"] {
//                        shifts.append(shift)
//                    }
//                }
//            } else if !isOnlyOneRoute && !allDay {
//                if possibleOption.contains(where: {$0 == dayInWeek}) {
//                    if let shift = allPossibleShift["PmTwoRouteNoRegion"] {
//                        shifts.append(shift)
//                    }
//                } else {
//                    if let shift = allPossibleShift["PmOneRouteWithRegion"] {
//                        shifts.append(shift)
//                    }
//                }
//            } else {
//                
//                if possibleOption.contains(where: {$0 == dayInWeek}) {
//                    if let shift = allPossibleShift["PmOneRouteNoRegion"] {
//                        shifts.append(shift)
//                    }
//                } else {
//                    if let shift = allPossibleShift["PmOneRouteWithRegion"] {
//                        shifts.append(shift)
//                    }
//                }
//            }
//        }
//    }
//    
//    func createShift(dayInWeek: Int, isOnlyOneRoute: Bool)
//    
//    func getShiftType(index: Int, isOnlyOneRoute: Bool) -> [String : Shift] {
//        
//        
//        
//        let possibleShift: [String : Shift] = [
//            "AllDayOneRouteNoRegion" : Shift(
//                routes: [
//                    Route(isAM: true, dayInWeek: index, ordersPerRoute: 13, hasRegion: false),
//                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: false)],
//                isOnlyOneRoute: isOnlyOneRoute),
//            "AllDayOneRouteWithRegion" : Shift(
//                routes: [
//                    Route(isAM: true, dayInWeek: index, ordersPerRoute: 13, hasRegion: true),
//                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: false)],
//                isOnlyOneRoute: isOnlyOneRoute),
//            "PmOneRouteWithRegion" : Shift(
//                routes: [
//                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: true)],
//                isOnlyOneRoute: isOnlyOneRoute),
//            "PmOneRouteNoRegion" : Shift(
//                routes: [
//                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: false)],
//                isOnlyOneRoute: isOnlyOneRoute),
//            "PmTwoRouteNoRegion" : Shift(
//                routes: [
//                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: false),
//                    Route(isAM: false, dayInWeek: index, ordersPerRoute: 13, hasRegion: false)],
//                isOnlyOneRoute: isOnlyOneRoute)
//        ]
//        return possibleShift
//    }
//}
