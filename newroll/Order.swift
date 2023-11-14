//
//  Order.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 08.11.2023.
//

// allday AM = 25 kc else 30 kc
// saturday AM = 30 kc else 25 kc
// variableOrderRate =

import Foundation

struct OrderPayRate {
    
    var totalOrderRate: Int {
        return variableOrderRate + orderBaseRate
    }
    
    let variableOrderRate = 28
    var orderBaseRate: Int {
        var baseRate = 25
        
        if isAM && dayInWeek == 6 {
            baseRate = 30
        } else if !isAM && dayInWeek != 6 {
            baseRate = 30
        }
        
        return baseRate
    }
    let isAM: Bool
    let dayInWeek: Int
    
    
}


