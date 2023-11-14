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
    
    init(isAM: Bool, dayInWeek: Int, ordersPerRoute: Int, hasRegion: Bool) {
        self.ordersPerRoute = ordersPerRoute
        self.orderPayRate = OrderPayRate(isAM: isAM, dayInWeek: dayInWeek)
        self.hasRegion = hasRegion
    }
    
    var orderPayRate: OrderPayRate
    
    var ordersPerRoute: Int
    
    var hasRegion: Bool
    
    let routeRate = 250
    
    let perRouteCarRent = 120
    
    var tip: Int {
        ordersPerRoute * 10
    }
    
    var totalEarnPerRoute: Int {
        return (orderPayRate.totalOrderRate * ordersPerRoute) + routeRate - perRouteCarRent + tip
    }
    
    static var routeOptions: [RouteOption : Route] = [:]
    
    
//    func getRouteOptions(ordersPerRoute: Int) -> [RouteOption : Route] {
//        
//        
//        for dayInWeek in 1...7 {
//            let routeOptions = [RouteOption.localAM : Route(isAM: true, dayInWeek: dayInWeek, ordersPerRoute: ordersPerRoute, hasRegion: false)]
//        }
//        
//        
//    }
}
