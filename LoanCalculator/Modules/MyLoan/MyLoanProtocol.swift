//
//  MyLoanProtocol.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol MyLoanViewProtocol: BaseViewProtocol {
    var presenter: MyLoanPresenterProtocol? { get set }
    func showEmptyView()
    func reloadData()
}

// MARK: Interactor
protocol MyLoanteractorInputProtocol: class {
    var presenter: MyLoanInteractorOutputProtocol? { get set }
    func getLoanList()
}

protocol MyLoanInteractorOutputProtocol: class {
    func getLoanListSuccess(loanList: [LoanListModel])
    func getLoanListFail()
}

protocol MyLoanPresenterProtocol: class {
    var interactor: MyLoanteractorInputProtocol? { get set }
    var loanList: [LoanListModel] { get }
    func viewDidLoaded()
    func loanClicked(index: Int)
    func addLoanClicked()
    func reloadLoan()
}

protocol MyLoanRouterProtocol: class {
    var viewController: UIViewController? { get set }
    func goToLoanDetail(loanData: LoanListModel)
    func goToAddLoan()
}
