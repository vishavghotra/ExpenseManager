//
//  SpendingsView.swift
//  TripManager
//
//  Created by Vishavjeet Ghotra on 14.04.23.
//

import SwiftUI

struct SpendingsView: View {
    var month: Month
    @ObservedObject var mockData: MockData
    @State private var showingAddTransactionSheet = false
    @State private var selectedCategory: String?
    var totalSpending: Float {
        let spendingsForMonth = mockData.spendings.filter { $0.month.monthName == month.monthName }.filter {
            selectedCategory == nil || $0.category == selectedCategory
        }
        let total = spendingsForMonth.reduce(0) { $0 + $1.amount }
        return total
    }
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                customView(totalSpending: totalSpending)
                Spacer()
                Button(
                    action: { showingAddTransactionSheet = true },
                    label: { Image(systemName: "plus").font(.title).padding().foregroundColor(.blue) })
            }
            Picker("Select Category", selection: $selectedCategory) {
                Text("All Categories").tag(nil as String?)
                ForEach(mockData.categories, id: \.self) { category in Text(category).tag(category as String?) }
            }.pickerStyle(MenuPickerStyle()).padding(.horizontal)
            List {
                ForEach(
                    mockData.spendings.filter { $0.month.monthName == month.monthName }
                        .filter {
                            selectedCategory == nil || $0.category == selectedCategory
                        }
                        .sorted(by: { $0.amount > $1.amount }), id: \.hashValue
                ) { spending in SpendingViewCell(spending: spending) }
            }.listStyle(InsetListStyle()).cornerRadius(20)
            Spacer()
        }.background(Color("BackgroundColor")).sheet(isPresented: $showingAddTransactionSheet) {
            AddSpendingView(mockData: mockData, month: month).background(Color("BackgroundColor"))
        }
    }
}

@ViewBuilder func customView(totalSpending: Float) -> some View {
    VStack(spacing: 1) {
        Text("Total spending").font(.headline).foregroundColor(.primary).padding(.top, 16).padding(.horizontal)
        Text(String(format: "€%.2f", totalSpending)).font(.title).fontWeight(.bold).foregroundColor(.primary).padding(
            .bottom, 16)
    }
}
struct SpendingsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.hashValue) { colorScheme in
            SpendingsView(month: Month("April"), mockData: MockData()).colorScheme(colorScheme)
        }
    }
}
