//
//  TabBarView.swift
//  SO Wallet
//
//  Created by стасик on 4.11.24.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            Spacer()
            TabBarItemView(
                iconName: "wallet.pass",
                title: "Categories",
                isSelected: selectedTab == .categories
            ) {
                selectedTab = .categories
            }
            Spacer()
            TabBarItemView(
                iconName: "chart.pie",
                title: "Overview",
                isSelected: selectedTab == .overview
            ) {
                selectedTab = .overview
            }
            Spacer()
            TabBarItemView(
                iconName: "clock",
                title: "History",
                isSelected: selectedTab == .history
            ) {
                selectedTab = .history
            }
            Spacer()
        }
        .padding(.vertical, 10)
        .background(Color.clear)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
    }
}

#Preview {
    TabBarView(selectedTab: .constant(.overview))
}
