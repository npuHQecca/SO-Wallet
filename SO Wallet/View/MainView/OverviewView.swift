//
//  OverviewView.swift
//  SO Wallet
//
//  Created by стасик on 5.11.24.
//

import SwiftUI
import Charts

struct OverviewView: View {
    @ObservedObject var expenseViewModel = ExpenseViewModel()
    let gridColumns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 30)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                .frame(height: UIScreen.main.bounds.height * 0.76)
                .frame(width: UIScreen.main.bounds.width * 0.94)
                .overlay(
                    VStack {
                        LazyVGrid(columns: gridColumns, spacing: 16) {
                            ForEach(expenseViewModel.expenseCategories.prefix(4)) { category in
                                VStack(spacing: 4) {
                                    Text(category.name)
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                    
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray, lineWidth: 2)
                                        .frame(width: 52, height: 52)
                                        .overlay(
                                            Image(systemName: category.icon)
                                                .font(.system(size: 24))
                                                .foregroundColor(category.color)
                                        )
                                        .onTapGesture {
                                            expenseViewModel.selectedCategory = category
                                            expenseViewModel.showAddExpenseOverlay = true
                                        }
                                    
                                    Text(String(format: "%.2f $", category.totalExpenses))
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        Spacer()
                        
                        ZStack {
                            if expenseViewModel.expenses.isEmpty {
                                Text("No expenses available")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            } else {
                                Chart(expenseViewModel.expenseCategories) { category in
                                    SectorMark(
                                        angle: .value("Expenses", category.totalExpenses),
                                        innerRadius: .ratio(0.86),
                                        angularInset: 2
                                    )
                                    .cornerRadius(6)
                                    .foregroundStyle(category.totalExpenses > 0 ? category.color : Color.gray)
                                }
                                .frame(width: 220, height: 220)
                                .padding()
                                
                                VStack {
                                    Text(String(format: "%.2f $", expenseViewModel.expenses.reduce(0) { $0 + $1.amount }))
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    Text("Total")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                )
                .overlay(
                    Group {
                        if expenseViewModel.showAddExpenseOverlay,
                           let selectedCategory = expenseViewModel.selectedCategory {
                            AddExpenseOverlay(category: selectedCategory, viewModel: expenseViewModel)
                        }
                    }
                )
            
            Spacer()
        }
        .padding(.bottom, 16)
        .onAppear {
            expenseViewModel.loadDefaultCategories()
        }
    }
}

#Preview {
    OverviewView()
}
