//
//  Event.swift
//  Event Countdown
//
//  Created by Bona Deny S on 10/28/25.
//

import SwiftUI

struct Event: Identifiable, Comparable {
    let id: UUID
    let title: String
    let date: Date
    let textColor: Color

    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
}

