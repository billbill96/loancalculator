//
//  RefreshTokenRequest.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation

struct RefreshTokenReqeust {
    let grantType: String
    let clientId: String
    let clientSecret: String
    let refreshToken: String
    
    init(refreshToken: String) {
        self.grantType = "refresh_token"
        self.clientId = "1"
        self.clientSecret = "XpWpMJTpGxn4B4hsb7cfwwMMCEHFuXiaCLx0emFp"
        self.refreshToken = refreshToken
    }
}
