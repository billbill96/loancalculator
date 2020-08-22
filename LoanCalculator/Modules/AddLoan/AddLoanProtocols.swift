//
//  AddLoanProtocols.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol AddLoanViewProtocol: BaseViewProtocol {
    var presenter: AddLoanPresenterProtocol? { get set }
    func setupData(type: AddLoanPageType)
}

// MARK: Interactor
protocol AddLoannteractorInputProtocol: class {
    var presenter: AddLoanInteractorOutputProtocol? { get set }
    func editLoan(amount: Int, term: Int, rate: Int, loadId: Int)
    func getLoanPreview(amount: Int, term: Int, rate: Int)
}

protocol AddLoanInteractorOutputProtocol: class {
    func editLoanSuccess(model: LoanListModel)
    func editLoanFail(error: Error)
    func getLoanPreviewSuccess(dataRequest: CreateLoanRequest, model: LoanListModel)
    func getLoanPreviewFail()
}

protocol AddLoanPresenterProtocol: class {
    var interactor: AddLoannteractorInputProtocol? { get set }
    func viewDidLoaded()
    func addButtonClicked(amount: String, term: String, rate: String)
}

protocol AddLoanRouterProtocol: class {
    var viewController: UIViewController? { get set }
    func goToLoanDetail(dataRequest: CreateLoanRequest, model: LoanListModel)
    func goToMyLoan()
    func goToLoanDetail()
}
