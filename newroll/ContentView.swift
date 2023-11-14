//
//  ContentView.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 08.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    
    var body: some View {
        DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
    }
}

#Preview {
    ContentView()
}
