//
//  CalendarViewModel.swift
//  newroll
//
//  Created by Tomáš Duchoslav on 13.11.2023.
//

import Foundation

class CalendarViewModel: ObservableObject {
    
    @Published var displayDate: String = ""
    
    init() {
        displayDate = calendarHelper.stringDate(actualDate)
    }
    
    private var actualDate: Date = Date() {
        didSet {
            displayDate = calendarHelper.stringDate(actualDate)
        }
    }
    
    private let calendarHelper = CalendarHelper()
    
    func minusMonth() {
        actualDate = calendarHelper.minusMonth(actualDate)
    }
    
    func plusMonth() {
        actualDate = calendarHelper.plusMonth(actualDate)
    }
}
