//
//  AddSpendingView.swift
//  TripManager
//
//  Created by Vishavjeet Ghotra on 15.04.23.
//
import SwiftUI
import OSLog

struct AddSpendingView: View {
  @Environment(\.dismiss) private var dismiss
  @ObservedObject var mockData: MockData
  var month: Month
  @State private var spendingName = ""
  @State private var spendingAmount = ""
  @State private var spendingCategory = "Grocery"
    private let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier ?? "",
        category: String(describing: AddSpendingView.self)
      )
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Spending Details")) {
          TextField("Name", text: $spendingName)
          TextField("Amount", text: $spendingAmount).keyboardType(.decimalPad)
          Picker("Category", selection: $spendingCategory) {
            ForEach(mockData.categories, id: \.self) { category in Text(category) }
          }
        }
        Section {
          Button("Save") {
            guard let amount = Float(spendingAmount) else {
                return }
            let newSpending = Spending(spendingName, month, amount, spendingCategory)
            mockData.spendings.append(newSpending)
              self.logger.log("New Transaction added!")
            dismiss()
          }
        }
        MoneyImage()
      }.navigationBarTitle("Add Spending").navigationBarItems(trailing: Button("Cancel") { dismiss() })
    }.navigationViewStyle(StackNavigationViewStyle())
  }
}
