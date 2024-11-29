//
//  ExpenseViewModel.swift
//  SO Wallet
//
//  Created by стасик on 16.11.24.
//

import Foundation
import SwiftUI

class ExpenseViewModel: ObservableObject {
    // Список категорий расходов
    @Published var expenseCategories: [ExpenseCategory] = []
    
    // Список всех расходов
    @Published var expenses: [Expense] = []
    
    // Для управления оверлеями
    @Published var showEditOverlay: Bool = false
    @Published var showAddExpenseOverlay: Bool = false
    
    // Выбранная категория
    @Published var selectedCategory: ExpenseCategory?
    
    // Поля для редактирования категории
    @Published var updatedCategoryName: String = ""
    @Published var updatedCategoryIcon: String = "car"

    // Максимальное количество категорий
    let maxCategories = 16

    // Категории по умолчанию
    private let defaultCategories = [
        ExpenseCategory(name: "Housing", icon: "house", color: Color("Color 1")),
        ExpenseCategory(name: "Clothing", icon: "tshirt", color: Color("Color 2")),
        ExpenseCategory(name: "Health", icon: "heart", color: Color("Color 3")),
        ExpenseCategory(name: "Gifts", icon: "gift", color: Color("Color 4")),
        ExpenseCategory(name: "Pets", icon: "pawprint", color: Color("Color 5")),
        ExpenseCategory(name: "Food", icon: "fork.knife", color: Color("Color 6")),
        ExpenseCategory(name: "Transport", icon: "car", color: Color("Color 7")),
        ExpenseCategory(name: "Travel", icon: "airplane", color: Color("Color 8")),
        ExpenseCategory(name: "Hobbies", icon: "guitar", color: Color("Color 9")),
        ExpenseCategory(name: "Education", icon: "book", color: Color("Color 10")),
        ExpenseCategory(name: "Entertainment", icon: "film", color: Color("Color 11")),
        ExpenseCategory(name: "Others", icon: "ellipsis", color: Color("Color 12"))
    ]

    // Инициализация ViewModel
    init() {
        loadDefaultCategories()
    }

    // Загрузка категорий по умолчанию
    func loadDefaultCategories() {
        guard expenseCategories.isEmpty else { return }
        let categoriesToLoad = defaultCategories.prefix(maxCategories)
        expenseCategories.append(contentsOf: categoriesToLoad)
    }

    // Добавление новой категории
    func addExpenseCategory() {
        guard expenseCategories.count < maxCategories else { return }
        let newCategory = ExpenseCategory(name: "New Category", icon: "star", color: Color.gray)
        expenseCategories.append(newCategory)
    }

    // Сохранение изменений в категории
    func saveCategoryChanges() {
        if let selectedCategory = selectedCategory,
           let index = expenseCategories.firstIndex(of: selectedCategory) {
            expenseCategories[index].name = updatedCategoryName
            expenseCategories[index].icon = updatedCategoryIcon
        }
        showEditOverlay = false
    }

    // Удаление категории
    func deleteCategory() {
        guard expenseCategories.count > 1 else {
            print("Cannot delete the last category.")
            return
        }
        
        if let selectedCategory = selectedCategory,
           let index = expenseCategories.firstIndex(of: selectedCategory) {
            expenseCategories.remove(at: index)
        }
        
        selectedCategory = nil
        showEditOverlay = false
    }

    // Добавление новой траты
    func addExpense(amount: Double, category: String, notes: String?) {
        let newExpense = Expense(
            id: UUID().uuidString,
            amount: amount,
            category: category,
            date: Date(),
            notes: notes
        )
        expenses.append(newExpense)
        updateCategoryExpenses()
    }

    // Обновление общей суммы расходов для каждой категории
    func updateCategoryExpenses() {
        for index in expenseCategories.indices {
            let categoryName = expenseCategories[index].name
            let total = expenses
                .filter { $0.category == categoryName }
                .reduce(0) { $0 + $1.amount }
            expenseCategories[index].totalExpenses = total
        }
    }
}
