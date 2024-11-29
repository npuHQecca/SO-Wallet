//
//  AddExpenseOverlay.swift
//  SO Wallet
//
//  Created by стасик on 26.11.24.
//

import SwiftUI

struct AddExpenseOverlay: View {
    var category: ExpenseCategory
    @ObservedObject var viewModel: ExpenseViewModel
    
    @State private var amount: String = ""
    @State private var notes: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Add Expense for \(category.name)")
                .font(.headline)
            
            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Notes", text: $notes)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                Button("Cancel") {
                    viewModel.showAddExpenseOverlay = false
                }
                .foregroundColor(.red)
                
                Spacer()
                
                Button("Add") {
                    if let amountValue = Double(amount) {
                        viewModel.addExpense(amount: amountValue, category: category.name, notes: notes.isEmpty ? nil : notes)
                        viewModel.showAddExpenseOverlay = false
                    }
                }
                .foregroundColor(.blue)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
        .shadow(radius: 10)
        .frame(width: UIScreen.main.bounds.width * 0.8)
    }
}

#Preview {
    AddExpenseOverlay(
        category: ExpenseCategory(name: "Food", icon: "fork.knife", color: Color.red),
        viewModel: ExpenseViewModel()
    )
}
