//
//  EventForm.swift
//  Event Countdown
//
//  Created by Bona Deny S on 10/28/25.
//

import SwiftUI

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    @Binding var events: [Event]
    var editingEvent: Event? = nil

    @State private var title = ""
    @State private var date = Date()
    @State private var textColor = Color.orange

    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                    .foregroundColor(textColor)

                DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
                ColorPicker("Text Color", selection: $textColor)
            }
        }
        .navigationTitle(editingEvent == nil ? "Add Event" : "Edit Event")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    saveEvent()
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                }
                .disabled(title.isEmpty)
            }
        }
        .onAppear {
            if let event = editingEvent {
                title = event.title
                date = event.date
                textColor = event.textColor
            }
        }
    }

    private func saveEvent() {
        if let editingEvent = editingEvent,
           let index = events.firstIndex(where: { $0.id == editingEvent.id }) {
            events[index] = Event(id: editingEvent.id, title: title, date: date, textColor: textColor)
        } else {
            let newEvent = Event(id: UUID(), title: title, date: date, textColor: textColor)
            events.append(newEvent)
        }
        events.sort()
    }
}
