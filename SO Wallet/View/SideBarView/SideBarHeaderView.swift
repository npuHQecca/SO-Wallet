//
//  SideBarHeaderView.swift
//  PostBank
//
//  Created by стасик on 11.08.24.
//

import SwiftUI

struct SideBarHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
                .foregroundColor(.white)
                .frame(width: 48, height: 48)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Olexandr Volkov")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                
                Text("Sangawere1@gmail.com")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    SideBarHeaderView()
}
