//
//  MyLoanModel.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import ObjectMapper

struct LoanListModel: Mappable {
    var id: Int?
    var loanAmount: Int?
    var loanTerm: Int?
    var interestRate: Double?
    var repaymentSchedules: [RepaymentSchedules]?
    
    init() {
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        loanAmount <- map["loan_amount"]
        loanTerm <- map["loan_term"]
        interestRate <- map["interest_rate"]
        repaymentSchedules <- map["repayment_schedules"]
    }
    
}

struct RepaymentSchedules: Mappable {
    
    var id: Int?
    var loanId: Int?
    var paymentNo: Int?
    var date: String?
    var paymentAmount: String?
    var principal: String?
    var interest: String?
    var balance: String?
    
    init() {
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        loanId <- map["loan_id"]
        paymentNo <- map["payment_no"]
        date <- map["date"]
        paymentAmount <- map["payment_amount"]
        principal <- map["principal"]
        interest <- map["interest"]
        balance <- map["balance"]
    }
}
