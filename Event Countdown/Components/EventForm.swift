//
//  EventForm.swift
//  Event Countdown
//
//  Created by Bona Deny S on 10/28/25.
//

import SwiftUI

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    var editingEvent: Event? = nil
    var onSave: (Event) -> Void

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
        .navigationTitle(editingEvent == nil ? "Add Event" : "Edit \(title)")
        .navigationBarTitleDisplayMode(.inline)
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
        let event = Event(
            id: editingEvent?.id ?? UUID(),
            title: title,
            date: date,
            textColor: textColor
        )
        onSave(event)
    }
}
