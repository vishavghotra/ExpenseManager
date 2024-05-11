//
//  MonthlyPieView.swift
//  TripManager
//
//  Created by Vishavjeet Ghotra on 16.04.23.
//

import SwiftUI
import Charts

struct MonthlyPieView: View {
  @ObservedObject var mockData: MockData
    //default Month: January
  @State private var selectedMonth = Month("January")

  var body: some View {
    VStack {
        Spacer()
      Picker("Select Month", selection: $selectedMonth) {
        ForEach(mockData.months, id: \.self) { month in
            Text(month.monthName).tag(month)
        }
      }
      .padding()
        
        Chart(Spending.mapToEntries(mockData.spendings, month: selectedMonth)) {
            spending in BarMark(
                x: .value("Category", spending.category),
                y:    .value("Amount", spending.amount)
                )
            .foregroundStyle(
                by: .value(
                    Text(verbatim: spending.category),
                    spending.category
                )
            )
        }
        .aspectRatio(1, contentMode: .fit)
                .padding()
        Spacer()
    }
  }
}


struct MonthlyPieView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.hashValue) { colorScheme in
            MonthlyPieView(mockData: MockData()).colorScheme(colorScheme)
        } }
}
