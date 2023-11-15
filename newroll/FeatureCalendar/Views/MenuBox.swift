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
    
    let shiftOptions: [String] = ["1+1", "0+1", "0+2", "1+2", "Clear"]
    
    var body: some View {
        Menu {
            ForEach(shiftOptions, id: \.self) { shift in
                Button(shift == "Clear" ? "Clear" : "Shift \(shift)") {
                    shiftSelected = shift == "Clear" ? "" : shift
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
    MenuBox(count: 1, start: 1)
}
