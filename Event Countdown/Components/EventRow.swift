//
//  EventRow.swift
//  Event Countdown
//
//  Created by Bona Deny S on 10/28/25.
//

import SwiftUI

struct EventRow: View {
    let event: Event

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(event.title)
                    .font(.headline)
                    .foregroundColor(event.textColor)
                Text(event.date.relativeDate())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .imageScale(.small)
        }
        .padding(.vertical, 6)
    }
}
