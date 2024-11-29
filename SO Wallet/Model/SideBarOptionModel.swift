//
//  SideBarOptionModel.swift
//  PostBank
//
//  Created by стасик on 3.09.24.
//

import SwiftUI

enum SideBarOptionModel: String, CaseIterable, Identifiable {
    case home = "Home"
    case profile = "Profile"
    case settings = "Settings"
    case support = "Support"

    var id: String { self.rawValue }
    var title: String {
        switch self {
        case .home: return "Home"
        case .profile: return "Profile"
        case .settings: return "Settings"
        case .support: return "Support"
        }
    }
    var systemImageName: String {
        switch self {
        case .home: return "house"
        case .profile: return "person.circle"
        case .settings: return "gearshape"
        case .support: return "questionmark.circle"
        }
    }
}
