//
//  PasswordRetrievalCodeView.swift
//  SO Wallet
//
//  Created by стасик on 30.10.24.
//

import SwiftUI

struct PasswordRetrievalCodeView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var code: [String] = Array(repeating: "", count: 6)
    @State private var errorMessage: String? = nil
    @FocusState private var focusedIndex: Int? // Следит за фокусом на каждом поле
    @State private var isCodeCorrect = false

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 20) {
                    Text("Enter the verification code")
                        .font(.system(size: 24))
                        .fontWeight(.light)
                        .padding(.top, 32)
                    
                    Text("Please enter the 6-digit code we sent to your email address.")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 50)
                    
                    HStack(spacing: 10) {
                        ForEach(0..<6) { index in
                            TextField("", text: $code[index])
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.width * 0.1)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .focused($focusedIndex, equals: index)
                                .onChange(of: code[index]) {
                                    if code[index].count > 1 {
                                        code[index] = String(code[index].prefix(1))
                                    }
                                    if code[index].count == 1 && index < 5 {
                                        focusedIndex = index + 1
                                    } else if code[index].isEmpty && index > 0 {
                                        focusedIndex = index - 1
                                    }
                                }
                        }
                    }
                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding(.top, 10)
                    }
                    
                    Button {
                        let enteredCode = code.joined()
                        if viewModel.verifyResetCode(inputCode: enteredCode) {
                            errorMessage = nil
                            isCodeCorrect = true
                        } else {
                            errorMessage = viewModel.errorMessage
                        }
                    } label: {
                        HStack {
                            Text("Next")
                                .font(.headline)
                                .fontWeight(.medium)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: geometry.size.width - 72, minHeight: 54)
                    }
                    .background(Color("TintColor"))
                    .cornerRadius(16)
                    .padding(.top, 50)
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Back to")
                            Text("Log In.")
                                .fontWeight(.bold)
                        }
                        .foregroundStyle(.black)
                        .font(.system(size: 14))
                    }
                }
                .padding()
                .onAppear {
                    focusedIndex = 0
                }
                .navigationDestination(isPresented: $isCodeCorrect) {
                    NewPasswordView(viewModel: viewModel) 
                }
            }
        }
    }
}

#Preview {
    PasswordRetrievalCodeView()
}
