//
//  CategoriesView.swift
//  SO Wallet
//
//  Created by стасик on 5.11.24.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject private var overlayViewModel = OverlayViewModel()

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Spacer(minLength: 30)
                
                IncomeView()
                
                Spacer()
                
                AccountsView()
                
                Spacer()
                
                ExpensesView()
            }
            .padding(.bottom, 16)
            
           
            if let overlay = overlayViewModel.overlayContent, overlayViewModel.isOverlayVisible {
                ZStack {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                overlayViewModel.hideOverlay()
                            }
                        }
                    overlay
                        .padding()
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(radius: 10)
                }
                .transition(.opacity)
                .animation(.easeInOut, value: overlayViewModel.isOverlayVisible)
            }
        }
        .environmentObject(overlayViewModel)
    }
}

#Preview {
    CategoriesView()
}
