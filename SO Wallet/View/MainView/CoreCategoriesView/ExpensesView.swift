//
//  ExpensesView.swift
//  SO Wallet
//
//  Created by стасик on 16.11.24.
//

import SwiftUI

struct ExpensesView: View {
    @StateObject private var viewModel = ExpenseViewModel()

    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Expenses")
                .font(.title2)
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)

            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                .overlay(
                    LazyVGrid(columns: columns, spacing: 16) {
                        if viewModel.expenseCategories.count < viewModel.maxCategories {
                            VStack(spacing: 4) {
                                Text("")
                                Button(action: {
                                    viewModel.addExpenseCategory()
                                }) {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray, lineWidth: 2)
                                        .frame(width: 52, height: 52)
                                        .overlay(
                                            Image(systemName: "plus")
                                                .font(.system(size: 24))
                                                .foregroundColor(.gray)
                                        )
                                }
                            }
                        }
                        ForEach(viewModel.expenseCategories) { category in
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
                                        viewModel.selectedCategory = category
                                        viewModel.updatedCategoryName = category.name
                                        viewModel.updatedCategoryIcon = category.icon
                                        viewModel.showEditOverlay = true
                                    }
                            }
                        }
                    }
                    .padding()
                )
                .frame(height: UIScreen.main.bounds.height * 0.40)
                .padding(.horizontal)
        }
        .padding(.bottom, 16)
        .overlay(
            Group {
                if viewModel.showEditOverlay {
                    ZStack {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()
                        
                        VStack {
                            Image(systemName: viewModel.updatedCategoryIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 72, height: 72)
                                .foregroundColor(.gray)
                                .padding(.vertical, 16)
                            
                            TextField("Category Name", text: $viewModel.updatedCategoryName)
                                .font(.title3)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .padding(.horizontal)
                            
                            HStack(spacing: 10) {
                                Button("Save") {
                                    viewModel.saveCategoryChanges()
                                }
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                
                                Button("Delete") {
                                    viewModel.deleteCategory()
                                }
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                
                                Button("Cancel") {
                                    viewModel.showEditOverlay = false
                                }
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 5)
                        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.35)
                    }
                    .transition(.opacity)
                }
            }
            .animation(.easeInOut(duration: 0.3), value: viewModel.showEditOverlay),
            alignment: .center
        )
    }
}

#Preview {
    ExpensesView()
}
