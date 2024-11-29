//
//  IncomeCategory.swift
//  SO Wallet
//
//  Created by стасик on 8.11.24.
//

import Foundation

struct IncomeCategory: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var icon: String
}

