//
//  EachDayView.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 15.11.2023.
//

import SwiftUI

struct EachDaysView: View {
    
    @Binding var currentDate: Date
    
    var body: some View {
        ForEach(0..<6) { row in
            
            let daysInMonth = CalendarHelper.daysInMonth(currentDate)
            let firstDayOfMonth = CalendarHelper.firstOfMonth(currentDate)
            let startingSpaces = CalendarHelper.weekDay(firstDayOfMonth)
            
            HStack(spacing: -1) {
                ForEach(1..<8) { column in
                    let count = column + (row * 7)
                    let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
                    
                    if (count - start) < 0 {
                        Text("")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .border(Color.borderColor)
                    } else if count - start > daysInMonth - 1 {
                        Color.clear
                    } else {
                        MenuBox(count: count, start: start, currentDate: $currentDate)
                    }
                }
            }
        }
    }
}

#Preview {
    EachDaysView(currentDate: .constant(Date()))
}
 
