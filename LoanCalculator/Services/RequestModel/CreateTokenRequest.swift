//
//  CreateTokenRequest.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation

struct CreateTokenRequest {
    let grantType: String
    let clientId: String
    let clientSecret: String
    let username: String
    let password: String
    
    init(username: String, password: String) {
        self.grantType = "password"
        self.clientId = "1"
        self.clientSecret = "XpWpMJTpGxn4B4hsb7cfwwMMCEHFuXiaCLx0emFp"
        self.username = username
        self.password = password
    }
}
