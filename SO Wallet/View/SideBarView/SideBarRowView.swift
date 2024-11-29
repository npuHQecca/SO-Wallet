//
//  SideBarRowView.swift
//  PostBank
//
//  Created by стасик on 11.08.24.
//

import SwiftUI

struct SideBarRowView: View {
    @Binding var selectedTheme: Bool
    @Binding var selectedLanguage: String
    @Binding var selectedCurrency: String
    
    let languages = ["English", "Русский", "Español"]
    let currencies = ["USD", "EUR", "RUB"]
    
    var body: some View {
        VStack(spacing: 16) {
            // Тема
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 42, height: 42)
                    .overlay(
                        Image(systemName: "paintbrush")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                    )
                
                Text("Theme")
                    .font(.system(size: 16, weight: .light))
                
                Spacer()
                
                Toggle(isOn: $selectedTheme) {
                    Text(selectedTheme ? "Dark" : "Light")
                }
                .labelsHidden()
            }
            
            Divider() // Разделитель
            
            // Язык
            HStack {
               
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 42, height: 42)
                    .overlay(
                        Image(systemName: "globe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                    )
                
                Text("Language")
                    .font(.system(size: 16, weight: .light))
                
                Spacer()
                
                Picker("Language", selection: $selectedLanguage) {
                    ForEach(languages, id: \.self) { language in
                        Text(language)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(maxWidth: 120)
            }
            
            Divider()
            
            // Валюта
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 42, height: 42)
                    .overlay(
                        Image(systemName: "dollarsign")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                    )
                
                Text("Currency")
                    .font(.system(size: 16, weight: .light))
                
                Spacer()
                
                Picker("Currency", selection: $selectedCurrency) {
                    ForEach(currencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(maxWidth: 120)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SideBarRowView(
        selectedTheme: .constant(false),
        selectedLanguage: .constant("English"),
        selectedCurrency: .constant("USD")
    )
}
