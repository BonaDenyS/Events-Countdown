//
//  EventsView.swift
//  Event Countdown
//
//  Created by Bona Deny S on 10/28/25.
//

import SwiftUI

struct EventsView: View {
    @State private var events: [Event] = []
    @State private var selectedEvent: Event?
    @State private var showingAddForm = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(events.sorted()) { event in
                    EventRow(event: event)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedEvent = event
                        }
                }
                .onDelete { indexSet in
                    events.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddForm = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(isPresented: $showingAddForm) {
                EventForm { newEvent in
                    events.append(newEvent)
                    events.sort()
                }
            }
            .navigationDestination(item: $selectedEvent) { event in
                EventForm(editingEvent: event) { updatedEvent in
                    if let index = events.firstIndex(where: { $0.id == updatedEvent.id }) {
                        events[index] = updatedEvent
                        events.sort()
                    }
                }
            }
        }
    }
}
