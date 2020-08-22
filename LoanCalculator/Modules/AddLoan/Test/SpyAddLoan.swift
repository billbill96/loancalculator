//
//  SpyAddLoan.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 23/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit
@testable import LoanCalculator

class SpyAddLoanViewController: UIViewController, AddLoanViewProtocol {
    var presenter: AddLoanPresenterProtocol?
    var countSetupData = 0
    
    func setupData(type: AddLoanPageType) {
        countSetupData += 1
    }
}

class SpyAddLoanInteractor: AddLoannteractorInputProtocol {
    var presenter: AddLoanInteractorOutputProtocol?
    var countEditLoan = 0
    var countGetLoanPreview = 0
    
    func editLoan(amount: Int, term: Int, rate: Int, loadId: Int) {
        countEditLoan += 1
    }
    
    func getLoanPreview(amount: Int, term: Int, rate: Int) {
        countGetLoanPreview += 1
    }
    
    
}

class SpyAddLoanRouter: AddLoanRouterProtocol {
    var viewController: UIViewController?
    var countGoToLoanDetail = 0
    var countGoToMyLoan = 0

    func goToLoanDetail(dataRequest: CreateLoanRequest, model: LoanListModel) {
        countGoToLoanDetail += 1
    }
    
    func goToMyLoan() {
        countGoToMyLoan += 1
    }
    
    func goToLoanDetail() {
        countGoToLoanDetail += 1
    }
    
    
}
