//
//  GaitChartView.swift
//  PaceMaster
//
//  Created by Yash's Mackbook on 03/03/25.
//
import SwiftUI
import Charts

struct GaitChartView<T: Identifiable>: View {
    var data: [T]
    var title: String
    var keyPath: KeyPath<T, Double>
    var color: Color

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.top)

            Chart {
                ForEach(data.indices, id: \.self) { index in
                    LineMark(
                        x: .value("Time", index),
                        y: .value(title, data[index][keyPath: keyPath])
                    )
                    .foregroundStyle(color)
                }
            }
            .frame(height: 200)
            .padding()
        }
    }
}
