//
//  ContentView.swift
//  TripManager
//
//  Created by Vishavjeet Ghotra on 13.04.23.
//

import SwiftUI

struct SpendingViewCell: View {
    var spending: Spending
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 16) {
                Text(spending.name)
                    .foregroundColor(.primary)
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Text(String(format: "€%.2f", spending.amount))
                    .foregroundColor(.primary)
                    .font(.title3)
                    .fontWeight(.regular)
            }
            Text(spending.category)
                .foregroundColor(.secondary)
                .font(.custom("ChivoMono-Italic", size: 16))  //Custom font
        }
        .padding(16)
        .cornerRadius(10)
    }
}
