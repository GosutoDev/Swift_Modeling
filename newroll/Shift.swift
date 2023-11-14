//
//  Shift.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 08.11.2023.
//

import Foundation

struct Shift {
    
    let routes: [Route]
    
    let perShiftEquipmentRent = 30
    
    var isOnlyOneRoute: Bool
    
    var regionRate: Int {
        let dayInWeek = routes.first?.orderPayRate.dayInWeek
        let possibleDays = [2, 5, 7]
        var regionRate = 0
        
        for route in routes {
            if route.hasRegion {
                if possibleDays.contains(where: {$0 == dayInWeek}) {
                    if isOnlyOneRoute {
                        regionRate = 500
                    } else {
                        regionRate = 250
                    }
                }
            }
        }
        return regionRate
    }
    
    var bonusTwoRoute: Int {
        var bonusRate = 0
        let possibleDays = [1, 4, 5, 7]
        
        if !isOnlyOneRoute {
            if possibleDays.contains(where: {$0 == routes.first?.orderPayRate.dayInWeek}) {
                bonusRate = 300
            }
        }
        
        return bonusRate
    }
    
    var bonusOneRoute: Int {
        var bonusRate = 0
        let possibleDays = [6, 7]
        
        if isOnlyOneRoute {
            if routes.contains(where: { $0.orderPayRate.isAM == true }) && possibleDays.contains(where: {$0 == routes.first?.orderPayRate.dayInWeek}) {
                bonusRate += 150
            }
            if routes.contains(where: { $0.orderPayRate.isAM == false }) {
                bonusRate += 150
            }
        }
        
        return bonusRate
    }
    
    var totalShiftEarn: Int {
        var total = 0
        for route in routes {
            total += route.totalEarnPerRoute
        }
        return total + bonusOneRoute + bonusTwoRoute - perShiftEquipmentRent + regionRate
    }
}
