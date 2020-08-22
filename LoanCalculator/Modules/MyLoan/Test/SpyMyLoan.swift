//
//  File.swift
//  LoanCalculatorTests
//
//  Created by Supannee Mutitanon on 23/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit
@testable import LoanCalculator

class SpyMyLoanViewController: UIViewController, MyLoanViewProtocol {
    var presenter: MyLoanPresenterProtocol?
    var countShowEmptyView = 0
    var countReloadData = 0
    
    func showEmptyView() {
        countShowEmptyView += 1
    }
    
    func reloadData() {
        countReloadData += 1
    }
}

class SpyMyLoanInteractor: MyLoanteractorInputProtocol {
    var presenter: MyLoanInteractorOutputProtocol?
    var countGetLoanList = 0
    
    func getLoanList() {
        countGetLoanList += 1
    }
}

class SpyMyLoanRouter: MyLoanRouterProtocol {
    var viewController: UIViewController?
    var countGoToLoanDetail = 0
    var coutnGoToAddLoan = 0
    
    func goToLoanDetail(loanData: LoanListModel) {
        countGoToLoanDetail += 1
    }
    
    func goToAddLoan() {
        coutnGoToAddLoan += 1
    }
}

