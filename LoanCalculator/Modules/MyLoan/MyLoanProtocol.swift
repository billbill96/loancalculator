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
protocol MyLoanViewProtocol: class {
    var presenter: MyLoanPresenterProtocol? { get set }
    func showEmptyView()
    func reloadData()
}

// MARK: Interactor
protocol MyLoanteractorInputProtocol: class {
    var presenter: MyLoanInteractorOutputProtocol? { get set }
}

protocol MyLoanInteractorOutputProtocol: class {
    
}

protocol MyLoanPresenterProtocol: class {
    var interactor: MyLoanteractorInputProtocol? { get set }
    var loanList: [LoanListModel] { get }
    func viewDidLoaded()
    func loanClicked(index: Int)
    func addLoanClicked()
}

protocol MyLoanRouterProtocol: class {
    var viewController: UIViewController? { get set }
    func goToLoanDetail(loanData: LoanListModel)
    func goToAddLoan()
}
