//
//  MenuBox.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 15.11.2023.
//

import SwiftUI

struct MenuBox: View {
    
    let count: Int
    let start: Int
    
    @State var shiftSelected = ""
    @Binding var currentDate: Date
    
    let shiftOptions: [String] = ["1+1", "0+1", "0+2", "1+2", "Clear"]
    
    var body: some View {
        Menu {
            ForEach(shiftOptions, id: \.self) { shift in
                Button(shift == "Clear" ? "Clear" : "Shift \(shift)") {
                    withAnimation {
                        shiftSelected = shift == "Clear" ? "" : shift
                    }
                }
            }
        } label: {
            Text("\(count - start + 1)")
                .font(.caption)
                .foregroundStyle(.black)
                .padding(6)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(getBackgroundColor().opacity(0.5))
                .border(Color.borderColor)
            
                .overlay {
                    Text(shiftSelected)
                        .font(.headline)
                        .italic()
                        .foregroundStyle(.black)
                }
        }
        
        .onChange(of: currentDate) {
            shiftSelected = ""
        }
        
    }
    
    func getBackgroundColor() -> Color {
        switch shiftSelected {
        case "1+1":
            return .yellow
        case "0+1":
            return .red
        case "0+2":
            return .blue
        case "1+2":
            return .green
        default:
            return .clear
        }
    }
}

#Preview {
    MenuBox(count: 1, start: 1, currentDate: .constant(Date()))
}
