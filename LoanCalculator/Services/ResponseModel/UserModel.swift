//
//  UserModel.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserModel: Mappable {
    var name: String?
    var email: String?
    
    init() {
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["data.name"]
        email <- map["data.email"]
    }
}
