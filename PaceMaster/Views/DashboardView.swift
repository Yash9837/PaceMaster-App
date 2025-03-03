//
//  DashboardView.swift
//  PaceMaster
//
//  Created by Yash's Mackbook on 03/03/25.
//
import SwiftUI
import Charts

struct DashboardView: View {
    @State private var isLiveDataPresented: Bool = false  // ✅ Controls the Live Data Popup

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all) // Dark mode background

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // **User Greeting & Notifications**
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Morning,")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                Text("Yash Gupta") // Dynamically change for user
                                    .font(.title.bold())
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            HStack(spacing: 15) {
                                Button(action: {
                                    print("Notifications tapped")
                                }) {
                                    Image(systemName: "bell.badge.fill")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                                Button(action: {
                                    print("Menu tapped")
                                }) {
                                    Image(systemName: "line.horizontal.3")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .padding(.horizontal)

                        // **Main Title**
                        Text("Discover your Gait Performance")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        // **Gait Metric Cards**
                        HStack(spacing: 15) {
                            GaitMetricCard(
                                title: "Stride Length",
                                value: "1.2 m",
                                description: "Stable",
                                icon: "figure.walk",
                                color: Color.blue.opacity(0.8)
                            )
                            GaitMetricCard(
                                title: "Foot Pressure",
                                value: "52 N",
                                description: "Balanced",
                                icon: "waveform.path.ecg",
                                color: Color.red.opacity(0.8)
                            )
                        }
                        .padding(.horizontal)
                        HStack(spacing: 15) {
                            GaitMetricCard(
                                title: "Acceleration",
                                value: "1.3 m/s²",
                                description: "Normal",
                                icon: "speedometer",
                                color: Color.green.opacity(0.8)
                            )
                            GaitMetricCard(
                                title: "Joint Angle",
                                value: "12.3°",
                                description: "Balanced",
                                icon: "angle",
                                color: Color.pink.opacity(0.8)
                            )
                        }
                        .padding(.horizontal)
                       


                        // **View Live Data Button (Triggers Popup)**
                        Button(action: {
                            isLiveDataPresented.toggle()
                        }) {
                            HStack {
                                Image(systemName: "chart.line.uptrend.xyaxis")
                                Text("View Live Data")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }
                        .padding(.horizontal)
                        .sheet(isPresented: $isLiveDataPresented) {
                            LiveDataView()
                        } // ✅ Opens Live Data Popup

                        Spacer()
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}

//// **Gait Metric Card**
//struct GaitMetricCard: View {
//    let title: String
//    let value: String
//    let description: String
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
//            Text(description)
//                .font(.caption)
//                .foregroundColor(.gray)
//        }
//        .padding()
//        .frame(maxWidth: .infinity)
//        .background(color)
//        .cornerRadius(16)
//    }
//}

// **🚀 Live Data Fullscreen Modal**
struct LiveDataView: View {
    @State private var strideLength: Double = 1.2
    @State private var footPressure: Double = 52
    @State private var acceleration: Double = 1.3
    @State private var JointAngle: Double = 25.4
    @State private var isAlertVisible: Bool = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                   

                   

                    // **🚨 Alerts Section**
                    if isAlertVisible {
                        AlertSection2()
                    }

                    // **📊 Live Charts**
                    Text("Live Data Graphs")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(.horizontal)

                    GaitChartRenderer(data: sampleGaitMetrics, title: "Stride Length", keyPath: \.strideLength, color: .blue)
                    GaitChartRenderer(data: sampleGaitMetrics, title: "Foot Pressure", keyPath: \.footPressure, color: .red)
                    GaitChartRenderer(data: sampleGaitMetrics, title: "Acceleration", keyPath: \.acceleration, color: .green)

                    // **Simulate Live Data Button**
                    Button(action: {
                        updateMetrics()
                    }) {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("Simulate Live Data")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding(.bottom, 20)
            }
        }
    }

    // **Simulate Real-Time Data Updates**
    func updateMetrics() {
        let newStride = Double.random(in: 1.0...1.5)
        let newPressure = Double.random(in: 45...60)
        let newAcceleration = Double.random(in: 1.0...1.6)

        strideLength = newStride
        footPressure = newPressure
        acceleration = newAcceleration

        // Trigger alert if values exceed safe limits
        isAlertVisible = newStride < 1.1 || newPressure > 58 || newAcceleration > 1.5
    }
}



// **🔹 Live Data Metric Card**
struct LiveMetricCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
            }
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Text(value)
                .font(.largeTitle.bold())
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(color)
        .cornerRadius(16)
    }
}

// **🚨 Alert Section (Detects Gait Anomalies)**
struct AlertSection2: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("🚨 Gait Alert")
                .font(.headline)
                .foregroundColor(.white)

            Text("⚠️ Abnormal gait detected! Please check your balance and step width.")
                .font(.caption)
                .foregroundColor(.red)
                .padding(.vertical, 5)

            Button(action: {
                print("Correct Gait")
            }) {
                Text("View Correction Guide")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

// **📊 Gait Chart Renderer**
struct GaitChartRenderer<T: Identifiable>: View {
    var data: [T]
    var title: String
    var keyPath: KeyPath<T, Double>
    var color: Color

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top)

            Chart {
                ForEach(data.indices, id: \.self) { index in
                    LineMark(
                        x: .value("Time", index),
                        y: .value(title, data[index][keyPath: keyPath])
                    )
                    .foregroundStyle(color)
                    .interpolationMethod(.catmullRom)
                }
            }
            .frame(height: 180)
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.1)))
        }
    }
}

#Preview{
    DashboardView()
}
