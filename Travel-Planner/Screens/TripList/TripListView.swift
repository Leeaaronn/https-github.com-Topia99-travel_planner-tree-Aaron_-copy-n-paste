//
//  TripListView.swift
//  Travel-Planner
//
//  Created by Jason Zeng on 10/10/24.
//

import SwiftUI

struct TripListView: View {
    @EnvironmentObject var tripViewModel: TripViewModel
    @State private var showAddTrip: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach($tripViewModel.trips) { $trip in
                        HStack {
                            NavigationLink(destination: TripView(trip: $trip)) {
                                Text(trip.title)
                                    .font(.headline)
                            }
                            
                            Spacer()
                            
                            // Export Button
                            Button(action: {
                                tripViewModel.exportTrip(trip)
                            }) {
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.blue)
                                    .padding(.leading, 8)
                            }
                            .buttonStyle(BorderlessButtonStyle()) // Prevents the button from triggering NavigationLink
                        }
                        .padding(.vertical, 8)
                    }
                }
                .navigationTitle("Trips")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showAddTrip.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $showAddTrip) {
                NavigationStack {
                    AddTripView()
                }
            }
        }
    }
}

#Preview {
    TripListView()
}
