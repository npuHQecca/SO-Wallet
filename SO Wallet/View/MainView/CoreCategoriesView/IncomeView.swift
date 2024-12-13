//
//  IncomeView.swift
//  SO Wallet
//
//  Created by стасик on 6.11.24.
//

import SwiftUI

struct IncomeView: View {
    @StateObject private var viewModel = IncomeViewModel()
    @EnvironmentObject var overlayViewModel: OverlayViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Income")
                .font(.title2)
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .frame(height: UIScreen.main.bounds.height * 0.1)
                    .frame(width: UIScreen.main.bounds.width * 0.94)
                    .overlay(
                        HStack(spacing: 16) {
                            if viewModel.incomeCategories.count < viewModel.maxCategories {
                                VStack(spacing: 4) {
                                    Text("")
                                    Button(action: {
                                        viewModel.addIncomeCategory()
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
                            ForEach(viewModel.incomeCategories) { category in
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
                                                .foregroundColor(.black)
                                        )
                                        .onTapGesture {
                                            viewModel.selectedCategory = category
                                            viewModel.updatedCategoryName = category.name
                                            viewModel.updatedCategoryIcon = category.icon
                                            
                                           
                                            overlayViewModel.showOverlay(EditOverlayView(viewModel: viewModel))
                                        }
                                }
                            }
                        }
                        .padding()
                    )
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding(.bottom, 16)
    }
}




#Preview {
    IncomeView()
}
