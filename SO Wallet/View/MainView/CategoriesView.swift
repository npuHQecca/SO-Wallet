//
//  CategoriesView.swift
//  SO Wallet
//
//  Created by стасик on 5.11.24.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 30)
            
            IncomeView()
            
            Spacer()
          
            AccountsView()
            
            Spacer()
            
            ExpensesView()
           
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    CategoriesView()
}
