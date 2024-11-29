//
//  SO_WalletApp.swift
//  SO Wallet
//
//  Created by стасик on 27.10.24.
//

import SwiftUI

@main
struct SO_WalletApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
