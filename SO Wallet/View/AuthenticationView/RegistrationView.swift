//
//  RegistrationView.swift
//  PostBank
//
//  Created by стасик on 14.07.24.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("SIGN UP")
                    .scaledToFit()
                    .font(.system(size: 28))
                    .fontWeight(.light)
                    .frame(width: 200, height: 40)
                    .padding(.vertical, 32)
                
                VStack(spacing: 12) {
                    AuthenticationInputView(text: $viewModel.email, title: "Email address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    AuthenticationInputView(text: $viewModel.password, title: "Password", placeholder: "Enter the password", isSecureField: true)
                    
                    AuthenticationInputView(text: $viewModel.confirmPassword, title: "Confirm password", placeholder: "Confirm password")
                        .autocapitalization(.none)
                }
                
                .padding(.top, 20)
                
                Button {
                    viewModel.registration()
                } label: {
                    HStack {
                        Text("Sign up")
                            .font(.headline)
                            .fontWeight(.medium)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 54)
                }
                .background(Color("TintColor"))
                .cornerRadius(16)
                .padding(.top, 32)
                
                Button{
                    dismiss()
                } label: {
                    HStack(spacing: 3){
                        Text("Already have an account?")
                        Text("Log In.")
                            .fontWeight(.bold)
                        
                    }
                    .foregroundStyle(.black)
                    .font(.system(size: 14))
                }
                VStack(spacing: 16) {
                    Text("SIGN IN")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    HStack(spacing: 24) {
                        SocialSignInButtonView(imageName: nil, label: "G") {
                            print("Google Sign In")
                        }
                        SocialSignInButtonView(imageName: nil, label: "F") {
                            print("Facebook Sign In")
                        }
                        SocialSignInButtonView(imageName: "applelogo", label: nil){
                            print("Apple Sign In")
                            
                        }
                    }
                }
                .padding(.top, 32)
                Spacer()
            }
        }
    }
}

#Preview {
    RegistrationView()
}
