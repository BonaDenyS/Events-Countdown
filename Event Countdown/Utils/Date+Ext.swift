//
//  Date+Ext.swift
//  Event Countdown
//
//  Created by Bona Deny S on 10/28/25.
//

import Foundation

extension Date {
    func relativeDate() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
