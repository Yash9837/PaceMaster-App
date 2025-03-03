//
//  InsightsView.swift
//  PaceMaster
//
//  Created by Yash's Mackbook on 03/03/25.
//
import SwiftUI

struct InsightsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all) // Dark Mode Background

                ScrollView {
                    VStack(spacing: 20) {
                        // **Title**
                        Text("Your Gait Performance Score")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .padding(.top, 20)

                        // **Circular Score View**
                        CircularScoreView(score: 85)

                        // **Gait Metric Cards**
                        HStack {
                            GaitMetricCard(
                                title: "Stride Balance",
                                value: "98%",
                                description: "Optimal",
                                icon: "chart.bar.fill",
                                color: Color.blue.opacity(0.3)
                            )
                            
                            GaitMetricCard(
                                title: "Foot Pressure",
                                value: "Balanced",
                                description: "No Risk",
                                icon: "waveform.path.ecg",
                                color: Color.red.opacity(0.3)
                            )
                        }
                        .padding()

                        // **Alert Section (Gait Correction)**
                        AlertSection()

                        // **Posture Analysis Section**
                        PostureAnalysis()

                        // **Injury Detection Panel**
                        InjuryDetection()

                        Spacer()
                    }
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

// **🟡 Circular Score Indicator**
struct CircularScoreView: View {
    let score: Int

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                Circle()
                    .trim(from: 0, to: CGFloat(score) / 100)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut(duration: 1.5))

                Text("\(score) Health")
                    .font(.title.bold())
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 200)
        }
    }
}

// **🚨 Alert Section (Detects Incorrect Gait)**
struct AlertSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("🚨 Alert Section")
                .font(.headline)
                .foregroundColor(.white)

            Text("⚠️ Your gait shows an imbalance detected in the left leg. Try adjusting your step width.")
                .font(.caption)
                .foregroundColor(.red)
                .padding(.vertical, 5)

            Button(action: {
                print("Correct Gait")
            }) {
                Text("See Correction Guide")
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

// **🧘‍♂️ Posture Analysis Section**
struct PostureAnalysis: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("🧘‍♂️ Posture Analysis")
                .font(.headline)
                .foregroundColor(.white)

            Text("Your posture is slightly leaning forward. Maintain an upright stance for better balance.")
                .font(.caption)
                .foregroundColor(.gray)

            HStack {
                PostureDetail(title: "Spine Alignment", value: "89%", icon: "arrow.up.and.down")
                PostureDetail(title: "Head Position", value: "Normal", icon: "person.fill.viewfinder")
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

// **🏥 Injury Detection Panel**
struct InjuryDetection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("🏥 Injury Risk Detection")
                .font(.headline)
                .foregroundColor(.white)

            Text("No major risks detected. Keep maintaining a balanced gait.")
                .font(.caption)
                .foregroundColor(.green)

            HStack {
                InjuryDetail(title: "Ankle Strain", value: "Low", icon: "cross.circle.fill")
                InjuryDetail(title: "Knee Stress", value: "Normal", icon: "bolt.heart.fill")
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

// **🔹 Small Posture Detail View**
struct PostureDetail: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }
}

// **🔹 Small Injury Detail View**
struct InjuryDetail: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(value == "High" ? .red : .green)
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
                .foregroundColor(value == "High" ? .red : .white)
        }
        .frame(maxWidth: .infinity)
    }
}

// ✅ Define the GaitMetricCard struct
struct GaitMetricCard: View {
    let title: String
    let value: String
    let description: String
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
            Text(description)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(color)
        .cornerRadius(16)
    }
}
