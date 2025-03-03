//
//  HistoryView.swift
//  PaceMaster
//
//  Created by Yash's Mackbook on 03/03/25.
//
import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading, spacing: 20) {
                    Text("Session History")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .padding(.top, 20)

                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(sampleGaitMetrics) { session in
                                SessionHistoryCard(session: session)
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}

// History Session Card
struct SessionHistoryCard: View {
    let session: GaitData

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("📅 \(session.timestamp)")
                .font(.headline)
                .foregroundColor(.white)

            HStack {
                MetricDetail(title: "Stride", value: String(format: "%.2f m", session.strideLength))
                MetricDetail(title: "Pressure", value: String(format: "%.2f N", session.footPressure))
                MetricDetail(title: "Accel", value: String(format: "%.2f m/s²", session.acceleration))
            }


        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.2)))
    }
}

// Small Metric Detail View
struct MetricDetail: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
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
