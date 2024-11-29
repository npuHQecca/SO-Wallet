//
//  AuthenticationInputView.swift
//  PostBank
//
//  Created by стасик on 11.07.24.
//

import SwiftUI

struct AuthenticationInputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .foregroundColor(Color(.black))
                .fontWeight(.regular)
                .font(.headline)
                .padding(.leading, 15)

            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .padding()
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color("TintColor"), lineWidth: 2)
                    )
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .padding()
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color("TintColor"), lineWidth: 2)
                    )
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    AuthenticationInputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
}
