//
//  ScrollView.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 13.11.2023.
//

import SwiftUI

struct TopScrollView: View {
    
    @EnvironmentObject private var vm: CalendarViewModel
    
    var body: some View {
        HStack {
            Button {
                vm.minusMonth()
            } label: {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .bold()
            }
            
            Text(vm.displayDate)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity)
            
            Button {
                vm.plusMonth()
            } label: {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    .bold()
            }
        }
    }
}

#Preview {
    TopScrollView()
}
