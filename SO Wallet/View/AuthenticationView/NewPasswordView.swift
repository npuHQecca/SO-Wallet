//
//  NewPasswordView.swift
//  SO Wallet
//
//  Created by стасик on 31.10.24.
//

import SwiftUI

struct NewPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AuthenticationViewModel
    @State private var showToast = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Reset Password")
                .font(.system(size: 28))
                .fontWeight(.light)
                .padding(.vertical, 32)
            
            VStack(spacing: 12) {
                AuthenticationInputView(
                    text: $viewModel.password,
                    title: "New Password",
                    placeholder: "Enter new password",
                    isSecureField: true
                )
                
                AuthenticationInputView(
                    text: $viewModel.confirmPassword,
                    title: "Confirm Password",
                    placeholder: "Confirm new password",
                    isSecureField: true
                )
            }
            
            Button {
                viewModel.resetPassword()
                if viewModel.isPasswordResetSuccessful {
                    showToast = true
                }
            } label: {
                HStack {
                    Text("Reset Password")
                        .font(.headline)
                        .fontWeight(.medium)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width - 32, height: 54)
                .background(Color("TintColor"))
                .cornerRadius(16)
            }
            .padding(.top, 32)
            .padding(.horizontal, 16)

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.subheadline)
                    .padding(.top, 10)
            }
            
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
        .navigationBarHidden(true)
        .overlay(
            Group {
                if showToast {
                    ZStack {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()
                        
                        VStack(spacing: 16) {
                            Text("Success")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("Your password has been reset successfully.")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .padding(.horizontal, 16)
                            
                            Button("OK") {
                                showToast = false
                                dismiss()
                            }
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 300, height: 54)
                            .background(Color("TintColor"))
                            .cornerRadius(16)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(radius: 10)
                        .frame(width: UIScreen.main.bounds.width * 0.7)
                    }
                    .transition(.opacity)
                }
            }
            .animation(.easeInOut(duration: 0.3), value: showToast),
            alignment: .center
        )
    }
}

#Preview {
    NewPasswordView(viewModel: AuthenticationViewModel())
}
