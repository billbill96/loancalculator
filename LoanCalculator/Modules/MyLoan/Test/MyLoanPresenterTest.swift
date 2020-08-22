//
//  MyLoanPresenterTest.swift
//  LoanCalculatorTests
//
//  Created by Supannee Mutitanon on 23/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import XCTest
@testable import LoanCalculator

class MyLoanPresenterTest: XCTestCase {

    var view: SpyMyLoanViewController!
    var interactor: SpyMyLoanInteractor!
    var router: SpyMyLoanRouter!
    var presenter: MyLoanPresenter!

    
    override func setUp() {
        view = SpyMyLoanViewController()
        interactor = SpyMyLoanInteractor()
        router = SpyMyLoanRouter()
        presenter = MyLoanPresenter(view: view,
                                    interactor: interactor,
                                    router: router, loanList: [])
    }
    
    func test_showEmptyView() {
        presenter.viewDidLoaded()
        XCTAssertEqual(view.countShowEmptyView, 1)
    }
    
    func test_reloadLoan() {
        presenter.reloadLoan()
        XCTAssertEqual(interactor.countGetLoanList, 1)
    }
}
