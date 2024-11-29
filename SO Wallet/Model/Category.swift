//
//  Category.swift
//  SO Wallet
//
//  Created by стасик on 2.11.24.
//

import Foundation

struct Category: Identifiable, Codable {
    var id: String
    var name: String
    var iconName: String
    var totalAmount: Double // общая сумма расходов в этой категории
}
