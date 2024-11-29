//
//  AccountAddView.swift
//  SO Wallet
//
//  Created by стасик on 24.11.24.
//

import SwiftUI

struct AccountAddView: View {
    @ObservedObject var viewModel: AccountViewModel

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("Add New Account")
                    .font(.headline)
                    .padding(.top)

                TextField("Account Name", text: $viewModel.newAccountName)
                    .font(.title3)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)

                Text("Select Icon")
                    .font(.subheadline)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(viewModel.availableIcons, id: \.self) { icon in
                            Image(systemName: icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(viewModel.newAccountIcon == icon ? Color.blue : Color.gray, lineWidth: 2)
                                )
                                .onTapGesture {
                                    viewModel.newAccountIcon = icon
                                }
                        }
                    }
                    .padding(.horizontal)
                }

                HStack(spacing: 10) {
                    Button("Add") {
                        viewModel.addAccountWithDetails()
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)

                    Button("Cancel") {
                        viewModel.showAddOverlay = false
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 5)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.5)
        }
    }
}

#Preview {
    AccountAddView(viewModel: {
        let vm = AccountViewModel()
        vm.newAccountName = "Savings"
        vm.newAccountIcon = "wallet.pass"
        return vm
    }())
}
