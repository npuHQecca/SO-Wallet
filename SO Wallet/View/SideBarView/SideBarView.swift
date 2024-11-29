//
//  SideBarView.swift
//  PostBank
//
//  Created by стасик on 7.08.24.
//

import SwiftUI

struct SideBarView: View {
    @Binding var isShowing: Bool
    @AppStorage("selectedTheme") private var selectedTheme: Bool = false
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "English"
    @AppStorage("selectedCurrency") private var selectedCurrency: String = "USD"
    
    private let sideBarWidth: CGFloat = 268
    private let sideBarSpacing: CGFloat = 32
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: sideBarSpacing) {
                SideBarHeaderView()
                
                Spacer()
                
                SideBarRowView(
                    selectedTheme: $selectedTheme,
                    selectedLanguage: $selectedLanguage,
                    selectedCurrency: $selectedCurrency
                )
                
                Spacer()
            
                Button(action: {
                    print("Logout tapped")
                }) {
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(width: 42, height: 42)
                            .overlay(
                                Image(systemName: "arrow.right.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.black)
                            )
                        
                        Text("Logout")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: 120)
                }
                .background(Color.clear)
                .cornerRadius(12)
                
                Divider()
                
                SideBarFooterView()
            }
            .padding()
            .frame(width: sideBarWidth, alignment: .leading)
            .background(Color.white)
            
            Spacer()
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut, value: isShowing)
    }
}

#Preview {
    SideBarView(isShowing: .constant(true))
}
