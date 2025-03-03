//
//  LiveMetricsView.swift
//  PaceMaster
//
//  Created by Yash's Mackbook on 03/03/25.
//import SwiftUI
//import Charts
//
//struct LiveMetricsView: View {
//    @State private var strideLength: Double = 1.2
//    @State private var footPressure: Double = 52
//    @State private var acceleration: Double = 1.3
//    @State private var isAlertVisible: Bool = false
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.black.edgesIgnoringSafeArea(.all)  // Dark Mode Background
//
//                ScrollView {
//                    VStack(alignment: .leading, spacing: 20) {
//                        // **Header**
//                        Text("Real-Time Gait Metrics")
//                            .font(.largeTitle.bold())
//                            .foregroundColor(.white)
//                            .padding(.top, 20)
//
//                        // **Live Gait Metrics Cards**
//                        HStack(spacing: 15) {
//                            LiveMetricCard(
//                                title: "Stride Length",
//                                value: String(format: "%.2f m", strideLength),  // ✅ Corrected formatting
//                                icon: "figure.walk",
//                                color: Color.blue.opacity(0.3)
//                            )
//                            
//                            LiveMetricCard(
//                                title: "Foot Pressure",
//                                value: String(format: "%.0f N", footPressure),  // ✅ No decimals for pressure
//                                icon: "waveform.path.ecg",
//                                color: Color.red.opacity(0.3)
//                            )
//                        }
//                        .padding(.horizontal)
//                        
//                        LiveMetricCard(
//                            title: "Acceleration",
//                            value: String(format: "%.2f m/s²", acceleration),  // ✅ Formatted correctly
//                            icon: "speedometer",
//                            color: Color.green.opacity(0.3)
//                        )
//                        .padding(.horizontal)
//
//                        // **Alerts Section**
//                        if isAlertVisible {
//                            AlertSection2()
//                        }
//
//                        // **Live Charts**
//                        Text("Live Data Graphs")
//                            .font(.title2.bold())
//                            .foregroundColor(.white)
//                            .padding(.top)
//
//                        GaitChartRenderer(data: sampleGaitMetrics, title: "Stride Length", keyPath: \.strideLength, color: .blue)
//                        GaitChartRenderer(data: sampleGaitMetrics, title: "Foot Pressure", keyPath: \.footPressure, color: .red)
//                        GaitChartRenderer(data: sampleGaitMetrics, title: "Acceleration", keyPath: \.acceleration, color: .green)
//
//                        // **Simulate Live Data Button**
//                        Button(action: {
//                            updateMetrics()
//                        }) {
//                            HStack {
//                                Image(systemName: "play.fill")
//                                Text("Simulate Live Data")
//                            }
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(12)
//                        }
//                        .padding(.horizontal)
//
//                        Spacer()
//                    }
//                    .padding(.bottom, 20)
//                }
//            }
//        }
//    }
//
//    // **Simulate Real-Time Data Updates**
//    func updateMetrics() {
//        let newStride = Double.random(in: 1.0...1.5)
//        let newPressure = Double.random(in: 45...60)
//        let newAcceleration = Double.random(in: 1.0...1.6)
//
//        strideLength = newStride
//        footPressure = newPressure
//        acceleration = newAcceleration
//
//        // Trigger alert if values exceed safe limits
//        if newStride < 1.1 || newPressure > 58 || newAcceleration > 1.5 {
//            isAlertVisible = true
//        } else {
//            isAlertVisible = false
//        }
//    }
//}
//
//// **🔹 Live Data Metric Card (Dark Mode)**
//struct LiveMetricCard: View {
//    let title: String
//    let value: String
//    let icon: String
//    let color: Color
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            HStack {
//                Image(systemName: icon)
//                    .font(.title)
//                    .foregroundColor(.white)
//                Spacer()
//            }
//            Text(title)
//                .font(.headline)
//                .foregroundColor(.white)
//            Text(value)
//                .font(.largeTitle.bold())
//                .foregroundColor(.white)
//        }
//        .padding()
//        .frame(maxWidth: .infinity)
//        .background(color)
//        .cornerRadius(16)
//    }
//}
//
//// **🚨 Alert Section (Detects Gait Anomalies)**
//struct AlertSection2: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            Text("🚨 Gait Alert")
//                .font(.headline)
//                .foregroundColor(.white)
//
//            Text("⚠️ Abnormal gait detected! Please check your balance and step width.")
//                .font(.caption)
//                .foregroundColor(.red)
//                .padding(.vertical, 5)
//
//            Button(action: {
//                print("Correct Gait")
//            }) {
//                Text("View Correction Guide")
//                    .font(.headline)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.red)
//                    .foregroundColor(.white)
//                    .cornerRadius(12)
//            }
//        }
//        .padding()
//        .background(Color.white.opacity(0.1))
//        .cornerRadius(16)
//        .padding(.horizontal)
//    }
//}
//
//// **📊 Gait Chart Renderer for Real-Time Metrics**
//struct GaitChartRenderer<T: Identifiable>: View {
//    var data: [T]
//    var title: String
//    var keyPath: KeyPath<T, Double>
//    var color: Color
//
//    var body: some View {
//        VStack {
//            Text(title)
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding(.top)
//
//            Chart {
//                ForEach(data.indices, id: \.self) { index in
//                    LineMark(
//                        x: .value("Time", index),
//                        y: .value(title, data[index][keyPath: keyPath])
//                    )
//                    .foregroundStyle(color)
//                    .interpolationMethod(.catmullRom)
//                }
//            }
//            .frame(height: 180)
//            .padding()
//            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.1)))
//        }
//    }
//}
