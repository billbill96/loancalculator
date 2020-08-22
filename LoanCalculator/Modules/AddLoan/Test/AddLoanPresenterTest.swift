//
//  AddLoanPresenterTest.swift
//  LoanCalculatorTests
//
//  Created by Supannee Mutitanon on 23/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import XCTest
@testable import LoanCalculator

class AddLoanPresenterTest: XCTestCase {

    var view: SpyAddLoanViewController!
    var interactor: SpyAddLoanInteractor!
    var router: SpyAddLoanRouter!
    var presenter: AddLoanPresenter!

    override func setUp() {
        view = SpyAddLoanViewController()
        interactor = SpyAddLoanInteractor()
        router = SpyAddLoanRouter()
        presenter = AddLoanPresenter(view: view,
                                     interactor: interactor,
                                     router: router,
                                     type: .add,
                                     loanId: 0)
    }
    
    func test_viewDidLoaded() {
        presenter.viewDidLoaded()
        XCTAssertEqual(view.countSetupData, 1)
    }

    func test_addButtonClicked_add() {
        view = SpyAddLoanViewController()
        interactor = SpyAddLoanInteractor()
        router = SpyAddLoanRouter()
        presenter = AddLoanPresenter(view: view,
                                     interactor: interactor,
                                     router: router,
                                     type: .add,
                                     loanId: 0)

        presenter.addButtonClicked(amount: "123", term: "123", rate: "123")
        XCTAssertEqual(interactor.countGetLoanPreview, 1)
    }
    
    func test_addButtonClicked_edit() {
        view = SpyAddLoanViewController()
        interactor = SpyAddLoanInteractor()
        router = SpyAddLoanRouter()
        presenter = AddLoanPresenter(view: view,
                                     interactor: interactor,
                                     router: router,
                                     type: .edit,
                                     loanId: 0)

        presenter.addButtonClicked(amount: "123", term: "123", rate: "123")
        XCTAssertEqual(interactor.countEditLoan, 1)
    }

}
