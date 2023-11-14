//
//  Calendar.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 13.11.2023.
//

import SwiftUI

struct CalendarView: View {
    
    let weekDays: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var body: some View {
        TopScrollView()
            .padding(.horizontal)
        
        VStack {
            HStack(spacing: 0) {
                ForEach(weekDays, id: \.self) { weekDay in
                        Text(weekDay)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
            
            VStack {
                ForEach(1..<7) { row in
                    HStack {
                        ForEach(1..<8) { day in
                            Text("1")
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding()
                    
                }
            }
        }
        
    }
    
    
    
}

#Preview {
    CalendarView()
        .environmentObject(CalendarViewModel())
}


