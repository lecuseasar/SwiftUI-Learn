//
//  ContentView.swift
//  BarChart
//
//  Created by emre argana on 5.02.2023.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    let viewMonths: [ViewMonth] = [
        .init(date: Date.from(year: 2023, month: 1, day: 1), viewCount: 550050),
        .init(date: Date.from(year: 2023, month: 2, day: 1), viewCount: 580050),
        .init(date: Date.from(year: 2023, month: 3, day: 1), viewCount: 900050),
        .init(date: Date.from(year: 2023, month: 4, day: 1), viewCount: 200050),
        .init(date: Date.from(year: 2023, month: 5, day: 1), viewCount: 330050),
        .init(date: Date.from(year: 2023, month: 6, day: 1), viewCount: 440050),
        .init(date: Date.from(year: 2023, month: 7, day: 1), viewCount: 450050),
        .init(date: Date.from(year: 2023, month: 8, day: 1), viewCount: 600050),
        .init(date: Date.from(year: 2023, month: 9, day: 1), viewCount: 680050),
        .init(date: Date.from(year: 2023, month: 10, day: 1), viewCount: 900500),
        .init(date: Date.from(year: 2023, month: 11, day: 1), viewCount: 600500),
        .init(date: Date.from(year: 2023, month: 12, day: 1), viewCount: 500500),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("YouTube Views")
            
            Text("Total \(viewMonths.reduce(0, {$0 + $1.viewCount}))")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 12)
            
            Chart {
                RuleMark(y: .value("Goal", 800000))
                    .foregroundStyle(.mint)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5, 10]))
//                    .annotation(alignment: .leading) {
//                        Text("Goal")
//                            .font(.caption)
//                            .fontWeight(.light)
//                            .foregroundColor(.secondary)
//                    }
                ForEach(viewMonths) { views in
                    BarMark (
                        x: .value("Date", views.date),
                        y: .value("View Count", views.viewCount)
                    )
                    .foregroundStyle(.purple.gradient)
                    .cornerRadius(3)
                }
            }
            .frame(height: 280)
            .chartXAxis {
                AxisMarks(values: viewMonths.map{ $0.date }) { date in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel(format: .dateTime.month(.narrow))
                }
            }
//            .chartYScale(domain: 0...200000)
//            .chartXAxis(.hidden)
//            .chartPlotStyle { plotContent in
//                plotContent
//                    .background(.purple.gradient.opacity(0.21))
//                    .border(.green, width: 1)
//            }
            HStack {
                Image(systemName: "line.diagonal")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(.mint)
                Text("Monthly Goal")
                    .foregroundColor(.secondary)
            }
            .font(.caption2)
            .padding(.leading, 4)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int
}

extension Date {
    static func from(year:Int, month: Int, day: Int)-> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}
