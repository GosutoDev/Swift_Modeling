//
//  Route.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 08.11.2023.
//

enum RouteOption: String {
    case localAM, localPM, regionAM, regionPM
}

import Foundation

class Route {
    
    private let _dayInWeek: Int
    
    init(isAM: Bool, dayInWeek: Int, ordersPerRoute: Int, hasRegion: Bool) {
        self.ordersPerRoute = ordersPerRoute
        self.hasRegion = hasRegion
        self.isAM = isAM
        self._dayInWeek = dayInWeek
    }
    
    let isAM: Bool
    
    var ordersPerRoute: Int
    
    var hasRegion: Bool
    
    var tipTotal: Double {
        Double(ordersPerRoute) * Rates.averageTip
    }
    
    var totalEarnings: Double {
        return (OrderPayRate.getOrderPayRate(dayInWeek: _dayInWeek, isAM: isAM) * Double(ordersPerRoute)) + Rates.routeRate - Rates.perRouteCarRent + tipTotal
    }
}

