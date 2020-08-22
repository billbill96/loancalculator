//
//  Model.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import ObjectMapper

struct ErrorModel: Error {
    let description: String
    
    init(error: Error) {
        self.description = error.localizedDescription
    }
}
