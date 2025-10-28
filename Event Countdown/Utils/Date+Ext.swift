//
//  Date+Ext.swift
//  Event Countdown
//
//  Created by Bona Deny S on 10/28/25.
//

import Foundation

extension Date {
    func relativeDescription(from referenceDate: Date = Date()) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents(
            [.year, .month, .weekOfYear, .day, .hour, .minute],
            from: referenceDate,
            to: self
        )

        if let year = components.year, abs(year) >= 1 {
            return year > 0 ? "in \(year) year\(year > 1 ? "s" : "")" : "\(-year) year\(abs(year) > 1 ? "s" : "") ago"
        } else if let month = components.month, abs(month) >= 1 {
            return month > 0 ? "in \(month) month\(month > 1 ? "s" : "")" : "\(-month) month\(abs(month) > 1 ? "s" : "") ago"
        } else if let week = components.weekOfYear, abs(week) >= 1 {
            return week > 0 ? "in \(week) week\(week > 1 ? "s" : "")" : "\(-week) week\(abs(week) > 1 ? "s" : "") ago"
        } else if let day = components.day, abs(day) >= 1 {
            return day > 0 ? "in \(day) day\(day > 1 ? "s" : "")" : "\(-day) day\(abs(day) > 1 ? "s" : "") ago"
        } else if let hour = components.hour, abs(hour) >= 1 {
            return hour > 0 ? "in \(hour) hour\(hour > 1 ? "s" : "")" : "\(-hour) hour\(abs(hour) > 1 ? "s" : "") ago"
        } else if let minute = components.minute, abs(minute) >= 1 {
            return minute > 0 ? "in \(minute) minute\(minute > 1 ? "s" : "")" : "\(-minute) minute\(abs(minute) > 1 ? "s" : "") ago"
        } else {
            return "just now"
        }
    }
}
