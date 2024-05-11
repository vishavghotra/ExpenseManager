//
//  MonthOverview.swift
//  TripManager
//
//  Created by Vishavjeet Ghotra on 14.04.23.
//

import SwiftUI

struct MonthOverview: View {
    @ObservedObject var mockData: MockData
    var body: some View {
            VStack(alignment: .center) {
                Text("Months")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Divider()
                    .padding(.horizontal, 20)
                List(mockData.months, id: \.self) { month in
                    NavigationLink(destination: SpendingsView(month: month, mockData: mockData)) {
                        MonthCell(month: month)
                    }
                }
                .listStyle(PlainListStyle())
                .cornerRadius(10)
                Spacer()
            }
            .background(Color("BackgroundColor"))
    }
}

struct MonthOverview_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.hashValue) { colorScheme in
            MonthOverview(mockData: MockData()).background(Color( "BackgroundColor")).colorScheme(colorScheme)
        }
    }
}
