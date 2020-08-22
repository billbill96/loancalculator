//
//  LoanDetailProtocol.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol LoanDetailViewProtocol: class {
    var presenter: LoanDetailPresenterProtocol? { get set }
    func setupView(with type: LoanDetailPageType, _ data: LoanListModel)
}

// MARK: Interactor
protocol LoanDetailteractorInputProtocol: class {
    var presenter: LoanDetailInteractorOutputProtocol? { get set }
    func deleteLoan(loanId: String)
}

protocol LoanDetailInteractorOutputProtocol: class {
    func deleteLoanSuccess()
    func deleteLoanFail()
    func createLoanSuccess(model: LoanListModel)
    func createLoanFail() 
}

protocol LoanDetailPresenterProtocol: class {
    var interactor: LoanDetailteractorInputProtocol? { get set }
    func viewDidLoaded()
    func updateData(loanData: LoanListModel)
    func editButtonClicked()
    func confirmButtonClicked()
    func deletebuttonClicked()
}

protocol LoanDetailRouterProtocol: class {
    var viewController: UIViewController? { get set }
    func goToEditLoan(loanId: Int)
    func goToMyLoan()
}
