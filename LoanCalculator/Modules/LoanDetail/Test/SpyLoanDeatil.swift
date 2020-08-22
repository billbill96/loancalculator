//
//  SpyLoanDeatil.swift
//  LoanCalculatorTests
//
//  Created by Supannee Mutitanon on 23/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit
@testable import LoanCalculator

class SpyLoanDetailViewController: UIViewController, LoanDetailViewProtocol {
    var presenter: LoanDetailPresenterProtocol?
    var countSetupView = 0
    var countReloadData = 0
    
    func setupView(with type: LoanDetailPageType, _ data: LoanListModel) {
        countSetupView += 1
    }
    
    func reloadData() {
        countReloadData += 1
    }
    
}

class SpyLoanDetailInteractor: LoanDetailteractorInputProtocol {
    var presenter: LoanDetailInteractorOutputProtocol?
    var countDeleteLoan = 0
    var countCreateLoan = 0
    
    func deleteLoan(loanId: String) {
        countDeleteLoan += 1
    }
    
    func createLoan(request: CreateLoanRequest, type: AddLoanPageType) {
        countCreateLoan += 1
    }
}

class SpyLoanDetailRouter: LoanDetailRouterProtocol {
    var viewController: UIViewController?
    var countGoToEditLoan = 0
    var countGoToMyLoan = 0
    
    func goToEditLoan(loanId: Int) {
        countGoToEditLoan += 1
    }
    
    func goToMyLoan() {
        countGoToMyLoan += 1
    }
    
    
}
