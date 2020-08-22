//
//  RefreshTokenModel.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import ObjectMapper

struct RefreshTokenModel: Mappable {
    
    var accessToken: String?
    var refreshToken: String?
    var expiresIn: Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        accessToken <- map["access_token"]
        refreshToken <- map["refresh_token"]
        expiresIn <- map["expires_in"]
    }
}
