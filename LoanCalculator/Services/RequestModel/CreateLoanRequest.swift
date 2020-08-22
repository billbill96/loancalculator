//
//  CreateLoanRequest.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation

struct CreateLoanRequest {
    let loadId: Int?
    let loanAmount: Int
    let loanTerm: Int
    let interestRate: Int
    let startMonth: Int
    let startYear: Int

}
