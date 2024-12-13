//
//  OverlayViewModel.swift
//  SO Wallet
//
//  Created by стасик on 2.12.24.
//

import SwiftUI

class OverlayViewModel: ObservableObject {
    @Published var isOverlayVisible: Bool = false
    @Published var overlayContent: AnyView? = nil

    func showOverlay<Content: View>(_ content: Content) {
        overlayContent = AnyView(content)
        isOverlayVisible = true
    }

    func hideOverlay() {
        isOverlayVisible = false
    }
}
