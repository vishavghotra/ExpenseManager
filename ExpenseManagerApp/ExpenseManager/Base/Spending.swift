//
//  Trip.swift
//  TripManager
//
//  Created by Vishavjeet Ghotra on 14.04.23.
//

import Charts
import Foundation
import OSLog

struct Spending: Codable, Identifiable {
  var id: UUID?
  var name: String
  var amount: Float
  var category: String
  var month: Month
  init(id: UUID? = nil, _ name: String, _ month: Month, _ amount: Float, _ category: String) {
    self.id = id
    self.name = name
    self.amount = amount
    self.category = category
    self.month = month
  }

  enum CodingKeys: String, CodingKey {
    case name
    case amount
    case category
    case month
  }

    static func mapToEntries(_ spendings: [Spending], month: Month) -> [Spending] {
    var categorySpendings = [String: Double]()

    let monthSpendings = spendings.filter { $0.month.monthName == month.monthName }
    // shows rounded Double because only round-off value required for Pie-chart
    for spending in monthSpendings {
      if let existingValue = categorySpendings[spending.category] {
        categorySpendings[spending.category] = existingValue + Double(spending.amount).rounded()
      } else {
        categorySpendings[spending.category] = Double(spending.amount).rounded()
      }
    }
        return categorySpendings.map { category, value in
            return Spending("", month, Float(value), category)
        }
  }
}

extension Spending: Hashable {
  static func == (lhs: Spending, rhs: Spending) -> Bool {
    return lhs.name == rhs.name && lhs.amount == rhs.amount && lhs.category == rhs.category
      && lhs.month == rhs.month
  }
}
