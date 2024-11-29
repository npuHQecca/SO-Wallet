//
//  MainView.swift
//  SO Wallet
//
//  Created by стасик on 3.11.24.
//

import SwiftUI

struct MainView: View {
    @State private var showMenu = false
    @State private var showMenuButton = true
    @State private var selectedTab: Tab = .categories
    @StateObject private var accountViewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    Spacer(minLength: 30)

                    switch selectedTab {
                    case .categories:
                        CategoriesView()
                    case .overview:
                        OverviewView()
                    case .history:
                        HistoryView()
                    }

                    Spacer()

                    TabBarView(selectedTab: $selectedTab)
                }
                .padding(.bottom, 16)

                SideBarManager(showMenu: $showMenu, showMenuButton: $showMenuButton)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if showMenuButton && !showMenu {
                        Button(action: {
                            withAnimation {
                                showMenu = true
                                showMenuButton = false
                            }
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .font(.title)
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                                .shadow(radius: 10)
                                .scaleEffect(x: 0.7, y: 1)
                        }
                    } else {
                        Color.clear.frame(width: 44, height: 44)
                    }
                }
                ToolbarItem(placement: .principal) {
                    if showMenuButton && !showMenu {
                        VStack {
                            Text("\(accountViewModel.getTotalBalance(), specifier: "%.2f") $")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                    } else {
                        Color.clear.frame(height: 44)
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MainView()
}
