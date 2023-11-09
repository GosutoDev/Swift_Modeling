//
//  ContentView.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 08.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            let setts = [
                ("PM One Route", true, false),
                ("PM Two Route", false, false),
                ("System 1+1", true, true)
            ]
            
            for sett in setts {
                var weekPerformance = Performance()
                weekPerformance.weekPerformance(isOnlyOneRoute: sett.1, allDay: sett.2)
                print(sett.0)
                print("Total earn: \(weekPerformance.totalEarnPerWeek)")
                print(" ")
            }
            
        } label: {
            Text("Testing")
                .font(.title).bold()
        }
    }
}

#Preview {
    ContentView()
}
