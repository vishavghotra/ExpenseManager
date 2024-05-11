//
//  TripManagerApp.swift
//  TripManager
//
//  Created by Vishavjeet Ghotra on 13.04.23.
//

import SwiftUI

@main
struct TripManagerApp: App {
    @StateObject var mockData = MockData()
    var body: some Scene {
        WindowGroup {
            AppHomeView(mockData: mockData).background(Color("BackgroundColor"))
        }
    }
}
