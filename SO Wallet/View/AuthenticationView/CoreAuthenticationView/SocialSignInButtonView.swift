//
//  SocialSignInButtonView.swift
//  SO Wallet
//
//  Created by стасик on 28.10.24.
//

import SwiftUI

struct SocialSignInButtonView: View {
    let imageName: String?
    let label: String?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 52, height: 52)
                    
                
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 38, height: 38)
                        .foregroundColor(.black)
                } else if let label = label {
                    Text(label)
                        .font(.system(size: 38, weight: .bold))
                        .foregroundColor(.black)
                }
            }
        }
    }
}


#Preview {
    SocialSignInButtonView(imageName: nil, label: "G") {
        print("Button tapped")
    }
}
