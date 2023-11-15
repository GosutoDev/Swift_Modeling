//
//  DateScrollerView.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 15.11.2023.
//

import SwiftUI

struct DateScrollerView: View {
    
    @Binding var currentDate: Date
    
    var body: some View {
        HStack {
            
            // Minus action button
            Button {
                currentDate = CalendarHelper.minusMonth(currentDate)
            } label: {
                Image(systemName: "arrow.left")
                    .font(.largeTitle).bold()
                    .foregroundStyle(.green)
            }
            
            // Dateholder
            Text(CalendarHelper.getDateScrollerString(currentDate))
                .font(.title).bold()
                .frame(maxWidth: .infinity)
            
            // Plus Action button
            Button {
                currentDate = CalendarHelper.plusMonth(currentDate)
            } label: {
                Image(systemName: "arrow.right")
                    .font(.largeTitle).bold()
                    .foregroundStyle(.green)
            }
        }
    }
}

#Preview {
    DateScrollerView(currentDate: .constant(Date()))
}
