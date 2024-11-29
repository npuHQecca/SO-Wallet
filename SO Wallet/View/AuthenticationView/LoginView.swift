//
//  LoginView.swift
//  PostBank
//
//  Created by стасик on 11.07.24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("SIGN IN")
                    .scaledToFit()
                    .font(.system(size: 28))
                    .fontWeight(.light)
                    .padding(.vertical, 32)
                
                VStack(spacing: 12) {
                    AuthenticationInputView(
                        text: $viewModel.email,
                        title: "Email Address",
                        placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    AuthenticationInputView(
                        text: $viewModel.password,
                        title: "Password",
                        placeholder: "Write your password here",
                        isSecureField: true)
                    
                    NavigationLink{
                        PasswordRetrievalView() 
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack{
                            Spacer()
                            Text("Forgot password?")
                                .safeAreaPadding(.trailing, 20)
                                .foregroundStyle(.black)
                        }
                    }
                }
                
                Button {
                    viewModel.login()
                } label: {
                    HStack {
                        Text("Sign in")
                            .font(.headline)
                            .fontWeight(.medium)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 54)
                }
                .background(Color("TintColor"))
                .cornerRadius(16)
                .padding(.top, 50)
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an Account?")
                        Text("Create Account.")
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
    LoginView()
}
