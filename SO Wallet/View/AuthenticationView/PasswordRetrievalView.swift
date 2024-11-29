//
//  PasswordRetrievalView.swift
//  SO Wallet
//
//  Created by стасик on 27.10.24.
//

import SwiftUI

struct PasswordRetrievalView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var showToast = false
    @State private var navigateToNextScreen = false
    @State private var emailError: String? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Forgot Password")
                    .scaledToFit()
                    .font(.system(size: 28))
                    .fontWeight(.light)
                    .frame(width: 200, height: 40)
                    .padding(.vertical, 32)
                
                Text("Having trouble logging in?")
                    .scaledToFit()
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(width: 250, height: 40)
                
                Text("Enter your email address, and we’ll send you a code to regain access to your account.")
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 50)
                
                VStack(spacing: 12) {
                    AuthenticationInputView(text: $viewModel.email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    if let emailError = emailError {
                        Text(emailError)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding(.top, 5)
                    }
                }
                
                Button {
                    // Проверка формата электронной почты
                    if viewModel.isValidEmail(viewModel.email) {
                        viewModel.passwordRetrieval()
                        emailError = nil
                        showToast = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showToast = false
                            navigateToNextScreen = true
                        }
                    } else {
                        emailError = "Please enter a valid email address."
                    }
                } label: {
                    HStack {
                        Text("Next")
                            .font(.headline)
                            .fontWeight(.medium)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 54)
                }
                .background(Color("TintColor"))
                .cornerRadius(16)
                .padding(.top, 12)
                
                VStack(spacing: 16) {
                    Text("OR SIGN IN")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    HStack(spacing: 24) {
                        SocialSignInButtonView(imageName: nil, label: "G") {
                            print("Google Sign In")
                        }
                        SocialSignInButtonView(imageName: nil, label: "F") {
                            print("Facebook Sign In")
                        }
                        SocialSignInButtonView(imageName: "applelogo", label: nil) {
                            print("Apple Sign In")
                        }
                    }
                }
                .padding(.top, 32)
                
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
            .overlay(
                Group {
                    if showToast {
                        ZStack {
                            Color.black.opacity(0.4)
                                .ignoresSafeArea()
                            
                            VStack{
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 72, height: 72)
                                    .foregroundColor(.gray)
                                    .padding(.vertical, 16)
                                
                                Text("Code Sent")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                Text("We've sent a reset code to your email. Please check your inbox.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width * 0.6)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.35)
                        }
                        .transition(.opacity)
                    }
                }
                    .animation(.easeInOut(duration: 0.3), value: showToast),
                alignment: .center
            )
            .navigationDestination(isPresented: $navigateToNextScreen) {
                PasswordRetrievalCodeView()
            }
        }
    }
}

#Preview {
    PasswordRetrievalView()
}
