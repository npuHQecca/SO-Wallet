//
//  SO_WalletApp.swift
//  SO Wallet
//
//  Created by стасик on 27.10.24.
//

/*import SwiftUI

@main
struct SO_WalletApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}*/
import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SO_WalletApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared

  var body: some Scene {
    WindowGroup {
      NavigationView {
          MainView()
              .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}
