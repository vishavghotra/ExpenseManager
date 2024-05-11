//
//  File.swift
//  TripManager
//
//  Created by Vishavjeet Ghotra on 14.04.23.
//

import Charts
import Foundation

class MockData: ObservableObject {
  @Published var spendings: [Spending]
  var months: [Month]
  var categories: [String]
  init(
    spendings: [Spending] = [],
    months: [Month] = [],
    categories: [String] = []
  ) {
    self.spendings = spendings
    self.months = [
      Month("January"), Month("February"), Month("March"), Month("April"), Month("May"),
      Month("June"), Month("July"), Month("August"), Month("September"), Month("October"),
      Month("November"), Month("December"),
    ]
    self.categories = [
      "Grocery", "Transportation", "Entertainment", "Eating", "Shopping", "Clothing", "Housing",
      "Gifts", "Donations", "Other",
    ]
    addJanuarySpendings()
    addFebruarySpendings()
    addMarchAndApril()
    addAprilSpendings()
  }
    
  func addJanuarySpendings() {
    self.spendings.append(contentsOf: [
      Spending("Rent", Month("January"), 1000.0, "Housing"),
      Spending("Grocery shopping", Month("January"), 200.0, "Grocery"),
      Spending("Books and supplies", Month("January"), 150.0, "Education"),
      Spending("Eating out", Month("January"), 80.0, "Eating"),
      Spending("Entertainment - Movie tickets", Month("January"), 50.0, "Entertainment"),
      Spending("Healthcare", Month("January"), 40.0, "Health"),
      Spending("Entertainment - Concert tickets", Month("January"), 25.0, "Entertainment"),
      Spending("Fitness classes", Month("January"), 20.0, "Health"),
      Spending("Grocery - REWE", Month("January"), 15.0, "Grocery"),
      Spending("Cloth Shopping", Month("January"), 80.0, "Clothing"),
      Spending("Entertainment - Online subscriptions", Month("January"), 10.0, "Entertainment"),
      Spending("Charity donation", Month("January"), 35.0, "Donations"),
      Spending("Entertainment - Video games", Month("January"), 30.0, "Entertainment"),
      Spending("Grocery - Dairy", Month("January"), 10.0, "Grocery"),
      Spending("Eating out - Fast food", Month("January"), 15.0, "Eating"),
      Spending("Gifts", Month("January"), 40.0, "Gifts"),
      Spending("Entertainment - Movie rental", Month("January"), 5.0, "Entertainment"),
    ])
  }
  func addFebruarySpendings() {
    spendings.append(contentsOf: [
      Spending("Rent", Month("February"), 1000.0, "Housing"),
      Spending("Grocery shopping", Month("February"), 250.0, "Grocery"),
      Spending("Transportation - Public transit", Month("February"), 100.0, "Transportation"),
      Spending("Entertainment - Movie tickets", Month("February"), 50.0, "Entertainment"),
      Spending("Eating out", Month("February"), 80.0, "Eating"),
      Spending("Healthcare", Month("February"), 30.0, "Health"),
      Spending("Grocery - Snacks", Month("February"), 20.0, "Grocery"),
      Spending("Entertainment - Concert tickets", Month("February"), 60.0, "Entertainment"),
      Spending("Fitness classes", Month("February"), 40.0, "Health"),
      Spending("Cloth Shopping", Month("February"), 100.0, "Clothing"),
      Spending("Entertainment - Online subscriptions", Month("February"), 15.0, "Entertainment"),
      Spending("Grocery - Dairy", Month("February"), 10.0, "Grocery"),
      Spending("Gifts", Month("February"), 50.0, "Gifts"),
      Spending("Transportation - Gasoline", Month("February"), 50.0, "Transportation"),
      Spending("Grocery - Meat", Month("February"), 20.0, "Grocery"),
      Spending("Entertainment - Concert tickets", Month("February"), 80.0, "Entertainment"),
      Spending("Eating out - Restaurant", Month("February"), 60.0, "Eating"),
    ])
  }

  func addMarchAndApril() {
    spendings.append(contentsOf: [
      Spending("Rent", Month("March"), 800.0, "Housing"),
      Spending("Grocery shopping", Month("March"), 200.0, "Grocery"),
      Spending("Books and supplies", Month("March"), 150.0, "Education"),
      Spending("Transportation", Month("March"), 100.0, "Transportation"),
      Spending("Eating out", Month("March"), 80.0, "Eating"),
      Spending("Entertainment - Movie tickets", Month("March"), 50.0, "Entertainment"),
      Spending("Healthcare", Month("March"), 40.0, "Health"),
      Spending("Entertainment - Concert tickets", Month("March"), 25.0, "Entertainment"),
      Spending("Fitness classes", Month("March"), 20.0, "Health"),
      Spending("Grocery - REWE", Month("March"), 15.0, "Grocery"),
      Spending("Cloth Shopping", Month("March"), 80.0, "Clothing"),
      Spending("Entertainment - Online subscriptions", Month("March"), 10.0, "Entertainment"),
      Spending("Charity donation", Month("March"), 45.0, "Donations"),
      Spending("Grocery - Dairy", Month("March"), 10.0, "Grocery"),
      Spending("Eating out - Fast food", Month("March"), 15.0, "Eating"),
      Spending("Gifts", Month("March"), 40.0, "Gifts"),
      Spending("Entertainment - Movie rental", Month("March"), 5.0, "Entertainment"),
    ])
  }

  func addAprilSpendings() {
    spendings.append(contentsOf: [
      Spending("Rent", Month("April"), 1000.0, "Housing"),
      Spending("Grocery shopping", Month("April"), 230.0, "Grocery"),
      Spending("Transportation - Public transit", Month("April"), 100.0, "Transportation"),
      Spending("Entertainment - Movie tickets", Month("April"), 40.0, "Entertainment"),
      Spending("Eating out", Month("April"), 70.0, "Eating"),
      Spending("Healthcare - Medications", Month("April"), 50.0, "Health"),
      Spending("Grocery - Snacks", Month("April"), 15.0, "Grocery"),
      Spending("Fitness classes", Month("April"), 30.0, "Health"),
      Spending("Cloth Shopping", Month("April"), 80.0, "Clothing"),
      Spending("Entertainment - Online subscriptions", Month("April"), 10.0, "Entertainment"),
      Spending("Charity donation", Month("April"), 10.0, "Donations"),
      Spending("Grocery - Dairy", Month("April"), 10.0, "Grocery"),
      Spending("Eating out - Fast food", Month("April"), 20.0, "Eating"),
      Spending("Gift", Month("April"), 30.0, "Gifts"),
      Spending("Entertainment - Movie rental", Month("April"), 35.0, "Entertainment"),
    ])
  }
}
