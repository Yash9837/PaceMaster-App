//
//  ChartRenderer.swift
//  PaceMaster
//
//  Created by Yash's Mackbook on 03/03/25.

import SwiftUI
import Charts

struct ChartRenderer<T: Identifiable>: View {
    var data: [T]
    var title: String
    var keyPath: KeyPath<T, Double>
    var color: Color

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(AppTheme.primaryColor)
                .padding(.top)

            Chart {
                ForEach(data.indices, id: \.self) { index in
                    LineMark(
                        x: .value("Time", index),  // Using index for a valid X-axis value
                        y: .value(title, data[index][keyPath: keyPath])
                    )
                    .foregroundStyle(color)
                    .interpolationMethod(.catmullRom)  // Smooth curve effect
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .frame(height: 200)
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 3))
        }
    }
}
