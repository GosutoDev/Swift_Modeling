//
//  Shift.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 08.11.2023.
//

import Foundation

struct Shift {
    
    init(routes: [Route], dayInWeek: Int) {
        self._dayInWeek = dayInWeek
        self.routes = routes
    }
    
    private let _dayInWeek: Int
    
    var routes: [Route] = []
    
    let perShiftEquipmentRent = 30.0
    
    var isOnlyOneRoute: Bool {
        return routes.count == 1
    }
    
    var regionRate: Double {
        let possibleDays = [2, 5, 7]
        var regionRate = 0.0
        
        for route in routes {
            if route.hasRegion {
                if possibleDays.contains(where: {$0 == _dayInWeek}) {
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
    
    
    var bonus: Double {
        var bonus = 0.0
        let hasAMRoute = routes.contains(where: { $0.isAM == true })
        let isWeekend = [6,7].contains(_dayInWeek)
        let isBonusDay = [1,4,5,7].contains(_dayInWeek)
        
        if isOnlyOneRoute {
            if hasAMRoute && isWeekend {
                bonus += 150.0
            }
            if !hasAMRoute {
                bonus += 150.0
            }
        } else {
            if !hasAMRoute && isBonusDay {
                bonus += 300.0
            }
        }
        
        return bonus
    }
    
    func getOrderPayRate(route : Route) -> Double{
        let isPremiumRate = (route.isAM && _dayInWeek == 6) || (!route.isAM && _dayInWeek != 6)
        var baseRate = 25.0
        
        if isPremiumRate {
            baseRate = 30.0
        }
        
        let variableOrderRate = 28.0
        
        var total = baseRate + variableOrderRate
        
        return total
    }
    
    var totalOrderEarnings: Double {
        var total = 0.0
        
        routes.forEach { route in
            total += route.totalEarnings
        }
        total = total - perShiftEquipmentRent + bonus + regionRate
        
        return total
    }
    
    var totalShiftEarn: Double {
        var total = 0.0
        for route in routes {
            total += route.totalEarnings
        }
        return total + bonus - perShiftEquipmentRent + regionRate
    }
    
    static func onePlusOne(dayInWeek: Int, ordersPerRoute: Int, hasRegion: Bool) -> Shift {
        let routes = [
            Route(isAM: true, dayInWeek: dayInWeek, ordersPerRoute: ordersPerRoute, hasRegion: hasRegion),
            Route(isAM: false, dayInWeek: dayInWeek, ordersPerRoute: ordersPerRoute, hasRegion: hasRegion)
        ]
        return Shift(routes: routes, dayInWeek: dayInWeek)
    }
    
    static func zeroPlusTwo(dayInWeek: Int, ordersPerRoute: Int, hasRegion: Bool) -> Shift {
        let routes = [
            Route(isAM: false, dayInWeek: dayInWeek, ordersPerRoute: ordersPerRoute, hasRegion: hasRegion),
            Route(isAM: false, dayInWeek: dayInWeek, ordersPerRoute: ordersPerRoute, hasRegion: hasRegion)
        ]
        return Shift(routes: routes, dayInWeek: dayInWeek)
    }
    
    static func zeroPlusOne(dayInWeek: Int, ordersPerRoute: Int, hasRegion: Bool) -> Shift {
        let routes = [
            Route(isAM: true, dayInWeek: dayInWeek, ordersPerRoute: ordersPerRoute, hasRegion: hasRegion),
            Route(isAM: false, dayInWeek: dayInWeek, ordersPerRoute: ordersPerRoute, hasRegion: hasRegion)
        ]
        return Shift(routes: routes, dayInWeek: dayInWeek)
    }
}
