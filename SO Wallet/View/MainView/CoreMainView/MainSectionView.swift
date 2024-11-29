//
//  MainSectionView.swift
//  SO Wallet
//
//  Created by стасик on 6.11.24.
//

import SwiftUI

struct MainSectionView<Content: View>: View {
    let title: String
    let height: CGFloat
    let content: Content
    
    init(title: String, height: CGFloat, @ViewBuilder content: () -> Content) {
        self.title = title
        self.height = height
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title2)
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .frame(height: height) 
                    .frame(width: UIScreen.main.bounds.width * 0.94)
                    .overlay(
                        content
                            .padding()
                    )
                Spacer()
            }
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    MainSectionView(title: "Income", height: UIScreen.main.bounds.height * 0.1) {
        Text("Content goes here")
    }
}

