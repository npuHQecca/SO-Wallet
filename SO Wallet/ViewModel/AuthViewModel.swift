//
//  AuthViewModel.swift
//  SO Wallet
//
//  Created by стасик on 20.12.24.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
}
