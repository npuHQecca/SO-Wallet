//
//  AccountsView.swift
//  SO Wallet
//
//  Created by стасик on 16.11.24.
//

import SwiftUI

struct AccountsView: View {
    @StateObject private var viewModel = AccountViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Accounts")
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
                            if viewModel.accounts.count < viewModel.maxAccounts {
                                VStack(spacing: 4) {
                                    Text("")
                                    Button(action: {
                                        viewModel.showAddOverlay = true
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
                            ForEach(viewModel.accounts) { account in
                                VStack(spacing: 4) {
                                    Text(account.name)
                                        .font(.caption2)
                                        .foregroundColor(.gray)

                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray, lineWidth: 2)
                                        .frame(width: 52, height: 52)
                                        .overlay(
                                            Image(systemName: account.icon)
                                                .font(.system(size: 24))
                                                .foregroundColor(.black)
                                        )
                                        .onTapGesture {
                                            viewModel.selectedAccount = account
                                            viewModel.updatedAccountName = account.name
                                            viewModel.updatedAccountIcon = account.icon
                                            viewModel.showEditOverlay = true
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
        .overlay(
            Group {
                if viewModel.showEditOverlay {
                    editOverlay
                } else if viewModel.showAddOverlay {
                    addOverlay
                }
            }
        )
        .animation(.easeInOut(duration: 0.3), value: viewModel.showEditOverlay || viewModel.showAddOverlay)
    }

    private var editOverlay: some View {
        AccountEditView(viewModel: viewModel)
    }

    private var addOverlay: some View {
        AccountAddView(viewModel: viewModel)
    }
}

#Preview {
    AccountsView()
}
