//
//  AccountViewModel.swift
//  SO Wallet
//
//  Created by стасик on 15.11.24.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    @Published var accounts: [Account] = [
        Account(name: "Cash", icon: "banknote", balance: 100.0)
    ]
    
    // Для редактирования аккаунта
    @Published var showEditOverlay: Bool = false
    @Published var selectedAccount: Account?
    @Published var updatedAccountName: String = ""
    @Published var updatedAccountIcon: String = "banknote"
    
    // Для добавления нового аккаунта
    @Published var showAddOverlay: Bool = false
    @Published var newAccountName: String = ""
    @Published var newAccountIcon: String = "banknote"

    // Доступные иконки для выбора
    let availableIcons: [String] = [
        "banknote", "creditcard", "creditcard.fill",
        "building.columns", "wallet.pass", "lock.shield",
        "dollarsign.circle", "suitcase", "chart.bar", "house"
    ]

    let maxAccounts = 4

    func getTotalBalance() -> Double {
        accounts.reduce(0) { $0 + $1.balance }
    }

    func addAccountWithDetails() {
        guard accounts.count < maxAccounts else { return }
        let accountName = newAccountName.isEmpty ? "New Account" : newAccountName
        accounts.append(Account(name: accountName, icon: newAccountIcon, balance: 0.0))
        newAccountName = ""
        newAccountIcon = "banknote"
        showAddOverlay = false
    }

    func saveAccountChanges() {
        if let selectedAccount = selectedAccount,
           let index = accounts.firstIndex(of: selectedAccount) {
            accounts[index].name = updatedAccountName
            accounts[index].icon = updatedAccountIcon
        }
        showEditOverlay = false
    }

    func deleteAccount() {
        if accounts.count > 1,
           let selectedAccount = selectedAccount,
           let index = accounts.firstIndex(of: selectedAccount) {
            accounts.remove(at: index)
        }
        selectedAccount = nil
        showEditOverlay = false
    }
}
