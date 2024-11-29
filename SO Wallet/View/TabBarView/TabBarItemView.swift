//
//  TabBarItemView.swift
//  SO Wallet
//
//  Created by стасик on 4.11.24.
//

import SwiftUI

struct TabBarItemView: View {
    let iconName: String
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: iconName)
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? .black : .gray)

                Text(title)
                    .font(.footnote)
                    .foregroundColor(isSelected ? .black : .gray)
            }
        }
    }
}

#Preview {
    TabBarItemView(
        iconName: "chart.pie",
        title: "Overview",
        isSelected: true,
        action: { print("Overview tab selected") }
    )
}
