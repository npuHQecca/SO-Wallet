//
//  SideBarFooterView.swift
//  PostBank
//
//  Created by стасик on 3.09.24.
//

import SwiftUI

struct SideBarFooterView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Text("© 2022 All Rights Reserved")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Text("Version: 1.1.1")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    SideBarFooterView()
}
