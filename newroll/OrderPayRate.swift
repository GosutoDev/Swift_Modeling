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
    
    static let variableOrderRate = 28.0
    
    static func getOrderPayRate(dayInWeek: Int, isAM: Bool) -> Double{
        let isPremiumRate = (isAM && dayInWeek == 6) || (!isAM && dayInWeek != 6)
        var baseRate = 25.0
        
        if isPremiumRate {
            baseRate = 30.0
        }
        
        let total = baseRate + variableOrderRate
        
        return total
    }
    
}


