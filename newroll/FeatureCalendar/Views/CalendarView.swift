//
//  SwiftUIView.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 15.11.2023.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var currentDate: Date = Date()
    
    var body: some View {
        DateScrollerView(currentDate: $currentDate)
            .padding(20)
        
        VStack(spacing: -1) {
            
            WeekDaysView()
            
            EachDaysView(currentDate: $currentDate)
            
        }
        .padding()
    }
}

#Preview {
    CalendarView()
}
