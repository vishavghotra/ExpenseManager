//
//  AppHomeView.swift
//  TripManager
//
//  Created by Vishavjeet Ghotra on 16.04.23.
//

import SwiftUI

struct AppHomeView: View {
    @ObservedObject var mockData: MockData
    @State var animationShown = false
    var body: some View {
        NavigationView {
            VStack(spacing: 80) {
                Spacer()
                Image("BudgetPie").resizable().scaledToFit().mask(RoundedRectangle(cornerRadius: 50)).frame(
                    width: 200)
                if animationShown {  // Source: Xpense
                    VStack(alignment: .center, spacing: 20) {
                        NavigationLink(destination: MonthOverview(mockData: mockData)) { CustomTextMonthly() }
                        NavigationLink(destination: MonthlyPieView(mockData: mockData)) { CustomTextAnalysis() }
                    }.transition(.opacity)
                }
                Spacer()
            }.frame(
                minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center
            )
            .background(Color("BackgroundColor"))
        }.task {
            withAnimation(Animation.easeInOut(duration: 1.0).delay(1)) { self.animationShown = true }
        }
    }
}

@ViewBuilder func CustomTextMonthly() -> some View {
    Text("Monthly Overview")
        .font(.title)
        .foregroundColor(.blue)
        .padding()
        .background(Color.yellow)
        .cornerRadius(10)
        .padding()
        .buttonStyle(PlainButtonStyle())
}

@ViewBuilder func CustomTextAnalysis() -> some View {
    Text("Monthly Analysis")
        .font(.title)
        .foregroundColor(.blue)
        .padding()
        .background(Color.yellow)
        .cornerRadius(10)
        .padding()
        .buttonStyle(PlainButtonStyle())
}

struct AppHomeViewProvider: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.hashValue) { colorScheme in
            AppHomeView(mockData: MockData()).colorScheme(colorScheme)
        }
    }
}
