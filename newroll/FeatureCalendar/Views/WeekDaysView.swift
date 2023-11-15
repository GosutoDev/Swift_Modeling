//
//  WeekDaysView.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 15.11.2023.
//

import SwiftUI

struct WeekDaysView: View {
    
    let weekdays: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(weekdays, id: \.self) { weekday in
                Text(weekday)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color.borderColor)
            }
        }
    }
}

#Preview {
    WeekDaysView()
}
