//
//  MonthCell.swift
//  TripManager
//
//  Created by Vishavjeet Ghotra on 14.04.23.
//

import SwiftUI

struct MonthCell: View {
  var month: Month
  var body: some View {
    HStack {
      Spacer()
      Text(month.monthName).bold().font(.largeTitle)
      Spacer()
    }.padding().cornerRadius(10)
  }
}


struct MonthCell_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.hashValue) { colorScheme in
            MonthCell(month: Month( "April")).background(Color("BackgroundColor")).colorScheme(colorScheme)
        }
    }
}
