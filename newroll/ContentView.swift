//
//  ContentView.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 08.11.2023.
//

import SwiftUI

enum Pickers {
    case Pondeli, Utery, Streda, Ctvrtek, Patek, Sobota, Nedele
}

struct ContentView: View {
    
    @State private var selection: String = ""
    
    let weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var body: some View {
        
        VStack {
            HStack(spacing: 0) {
                ForEach(weekdays, id: \.self) { weekday in
                        Text(weekday)
                        .font(.system(size: 15))
                        .lineLimit(0)
                        .frame(width: 50, height: 50)
                        .border(Color.black)
                }
            }
            HStack {
                
            }
        }
        
        

        
        
        
        testButton
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    var testButton: some View {
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
