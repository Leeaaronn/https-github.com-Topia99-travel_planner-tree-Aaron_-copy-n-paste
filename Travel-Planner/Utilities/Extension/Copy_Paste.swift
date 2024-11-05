//
//  Copy_Paste.swift
//  Travel-Planner
//
//  Created by Aaron Lee on 11/3/24.
//

import Foundation
import UIKit

extension Trip {
    // Function to export the trip details as a shareable text format
    func exportAsText() -> String {
        var exportText = "Itinerary: \(title)\n"
        exportText += "Start Date: \(DateUtilities.formattedDate(startDate))\n"
        exportText += "End Date: \(DateUtilities.formattedDate(endDate))\n"
        exportText += "Destinations: \(destinations.joined(separator: ", "))\n"
        exportText += "\n--- Day Plans ---\n"
        
        for dayPlan in dayPlans {
            exportText += "\nDate: \(DateUtilities.formattedDate_WeekDay_Date(dayPlan.date))\n"
            for item in dayPlan.items {
                exportText += "- \(item)\n"
            }
        }
        
        return exportText
    }
}

class ItineraryExporter {
    // Function to copy the exported itinerary text to clipboard
    static func copyToClipboard(trip: Trip) {
        let itineraryText = trip.exportAsText()
        UIPasteboard.general.string = itineraryText
        print("Itinerary copied to clipboard.")
    }
}
