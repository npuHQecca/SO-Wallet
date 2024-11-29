//
//  SideBarManager.swift
//  SO Wallet
//
//  Created by стасик on 4.11.24.
//

import SwiftUI

struct SideBarManager: View {
    @Binding var showMenu: Bool
    @Binding var showMenuButton: Bool

    var body: some View {
        ZStack {
            if showMenu {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showMenu = false
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            showMenuButton = true
                        }
                    }
                    .zIndex(1)
            }

            if showMenu {
                SideBarView(isShowing: $showMenu)
                    .zIndex(2)
                    .transition(.move(edge: .leading))
                    .onDisappear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            showMenuButton = true
                        }
                    }
            }
        }
        .animation(.easeInOut(duration: 0.3), value: showMenu)
    }
}

#Preview {
    SideBarManager(showMenu: .constant(true), showMenuButton: .constant(true))
}
