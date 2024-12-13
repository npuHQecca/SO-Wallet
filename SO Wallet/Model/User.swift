//
//  User.swift
//  SO Wallet
//
//  Created by стасик on 2.11.24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    
}

extension User {
    static var MOK_USER = User(id: NSUUID().uuidString, email: "Sangawere1@gmail.com")
}
