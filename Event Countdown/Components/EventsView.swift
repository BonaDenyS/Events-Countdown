//
//  EventsView.swift
//  Event Countdown
//
//  Created by Bona Deny S on 10/28/25.
//

import SwiftUI

struct EventsView: View {
    @State private var events: [Event] = []
    @State private var showingAddEvent = false
    @State private var editingEvent: Event? = nil

    var body: some View {
        NavigationStack {
            List {
                ForEach(events.sorted()) { event in
                    Button {
                        editingEvent = event
                    } label: {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: deleteEvent)
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddEvent = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddEvent) {
                NavigationStack {
                    EventForm(events: $events)
                }
            }
            .sheet(item: $editingEvent) { event in
                NavigationStack {
                    EventForm(events: $events, editingEvent: event)
                }
            }
        }
    }

    private func deleteEvent(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
    }
}
