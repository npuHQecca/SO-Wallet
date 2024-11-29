//
//  Expense.swift
//  SO Wallet
//
//  Created by стасик on 2.11.24.
//

import Foundation
import SwiftUI

struct Expense: Identifiable, Codable {
    var id: String
    var amount: Double
    var category: String
    var date: Date
    var notes: String?
}

struct ExpenseCategory: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var icon: String
    var color: Color
    var totalExpenses: Double = 0.0 // Новое поле для хранения общей суммы расходов
    
    static func == (lhs: ExpenseCategory, rhs: ExpenseCategory) -> Bool {
        return lhs.id == rhs.id
    }
}
