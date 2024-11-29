//
//  IncomeViewModel.swift
//  SO Wallet
//
//  Created by стасик on 8.11.24.
//

import SwiftUI

class IncomeViewModel: ObservableObject {
    @Published var incomeCategories: [IncomeCategory] = [IncomeCategory(name: "Salary", icon: "briefcase")]
    @Published var showEditOverlay: Bool = false
    @Published var selectedCategory: IncomeCategory?
    @Published var updatedCategoryName: String = ""
    @Published var updatedCategoryIcon: String = "briefcase"
    
    let maxCategories = 4

    // Добавление новой категории дохода
    func addIncomeCategory() {
        guard incomeCategories.count < maxCategories else { return }
        incomeCategories.append(IncomeCategory(name: "New Income", icon: "briefcase"))
    }

    // Сохранение изменений в категории
    func saveCategoryChanges() {
        if let selectedCategory = selectedCategory,
           let index = incomeCategories.firstIndex(of: selectedCategory) {
            incomeCategories[index].name = updatedCategoryName
            incomeCategories[index].icon = updatedCategoryIcon
        }
        showEditOverlay = false
    }

    // Удаление категории, если их больше одной
    func deleteCategory() {
        if incomeCategories.count > 1, // Проверка на обязательное наличие хотя бы одной категории
           let selectedCategory = selectedCategory,
           let index = incomeCategories.firstIndex(of: selectedCategory) {
            incomeCategories.remove(at: index)
        }
        selectedCategory = nil // Сброс выбранной категории после удаления
        showEditOverlay = false
    }
}
