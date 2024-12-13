//
//  EditOverlayView.swift
//  SO Wallet
//
//  Created by стасик on 2.12.24.
//

import SwiftUI

struct EditOverlayView: View {
    @ObservedObject var viewModel: IncomeViewModel
    @EnvironmentObject var overlayViewModel: OverlayViewModel

    var body: some View {
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
                    overlayViewModel.hideOverlay()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button("Delete") {
                    viewModel.deleteCategory()
                    overlayViewModel.hideOverlay() // Скрыть оверлей
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button("Cancel") {
                    overlayViewModel.hideOverlay() // Скрыть оверлей
                }
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.3)
        .frame(width: UIScreen.main.bounds.width * 0.76)
    }
}
