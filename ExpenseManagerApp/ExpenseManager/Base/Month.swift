//
//  Group.swift
//  TripManager
//
//  Created by Vishavjeet Ghotra on 14.04.23.
//

import Foundation

struct Month: Codable {
  var monthName: String
  var id: UUID?
  init(id: UUID? = nil, _ monthName: String) {
    self.id = id
    self.monthName = monthName
  }
}

extension Month: Hashable {
}
