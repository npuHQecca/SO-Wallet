//
//  Account.swift
//  SO Wallet
//
//  Created by стасик on 15.11.24.
//

import Foundation

struct Account: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var icon: String
    var balance: Double
}
