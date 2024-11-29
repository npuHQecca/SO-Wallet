//
//  AccountEditView.swift
//  SO Wallet
//
//  Created by стасик on 16.11.24.
//

import SwiftUI

struct AccountEditView: View {
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: viewModel.updatedAccountIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .foregroundColor(.gray)
                    .padding(.vertical, 16)

                TextField("Account Name", text: $viewModel.updatedAccountName)
                    .font(.title3)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)

                HStack(spacing: 10) {
                    Button("Save") {
                        viewModel.saveAccountChanges()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)

                    Button("Delete") {
                        viewModel.deleteAccount()
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
    }
}

#Preview {
    AccountEditView(viewModel: {
        let vm = AccountViewModel()
        vm.updatedAccountName = "Savings"
        vm.updatedAccountIcon = "creditcard"
        return vm
    }())
}
