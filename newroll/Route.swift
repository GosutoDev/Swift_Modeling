//
//  Route.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 08.11.2023.
//

import Foundation

class Route {
    
    init(isAM: Bool, dayInWeek: Int, ordersPerRoute: Int, hasRegion: Bool) {
        self.ordersPerRoute = ordersPerRoute
        self.order = Order(isAM: isAM, dayInWeek: dayInWeek)
        self.hasRegion = hasRegion
    }
    
    var order: Order
    
    var ordersPerRoute: Int
    
    var hasRegion: Bool
    
    let routeRate = 250
    
    let perRouteCarRent = 120
    
    var tip: Int {
        ordersPerRoute * 10
    }
    
    var totalEarnPerRoute: Int {
        return (order.totalOrderRate * ordersPerRoute) + routeRate - perRouteCarRent + tip
    }
    
    
}
