//
//  GaitData.swift
//  PaceMaster
//
//  Created by Yash's Mackbook on 03/03/25.
//
import Foundation

struct GaitData: Identifiable {
    let id = UUID()
    let index: Int  // Added to be used for charts
    let timestamp: String
    let strideLength: Double
    let footPressure: Double
    let acceleration: Double
}

// Sample Data with Index for Charting
let sampleGaitMetrics = [
    GaitData(index: 1, timestamp: "10:00 AM", strideLength: 1.2, footPressure: 50, acceleration: 1.1),
    GaitData(index: 2, timestamp: "10:05 AM", strideLength: 1.4, footPressure: 55, acceleration: 1.3),
    GaitData(index: 3, timestamp: "10:10 AM", strideLength: 1.1, footPressure: 45, acceleration: 1.0),
    GaitData(index: 4, timestamp: "10:15 AM", strideLength: 1.3, footPressure: 52, acceleration: 1.2)
]
