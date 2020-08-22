//
//  LoanDetailPresenterTest.swift
//  LoanCalculatorTests
//
//  Created by Supannee Mutitanon on 23/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import XCTest
@testable import LoanCalculator

class LoanDetailPresenterTest: XCTestCase {

    var view: SpyLoanDetailViewController!
    var interactor: SpyLoanDetailInteractor!
    var router: SpyLoanDetailRouter!
    var presenter: LoanDetailPresenter!

    override func setUp() {
        view = SpyLoanDetailViewController()
        interactor = SpyLoanDetailInteractor()
        router = SpyLoanDetailRouter()
        var mockModel = LoanListModel()
        mockModel.id = 0
        let mockDataRequest = CreateLoanRequest(loadId: 0, loanAmount: 0, loanTerm: 0, interestRate: 0, startMonth: 0, startYear: 0)
        presenter = LoanDetailPresenter(view: view,
                                        interactor: interactor,
                                        router: router,
                                        type: .calculator,
                                        loanData: mockModel,
                                        dataRequest: mockDataRequest)
    }
    
    func test_viewDidLoad() {
        presenter.viewDidLoaded()
        XCTAssertEqual(view.countSetupView, 1)
    }
    
    func test_updateData() {
        presenter.updateData(loanData: LoanListModel())
        XCTAssertEqual(view.countSetupView, 1)
        XCTAssertEqual(view.countReloadData, 1)
    }
    
    func test_editButtonClicked() {
        presenter.editButtonClicked()
        XCTAssertEqual(router.countGoToEditLoan, 1)
    }
    
    func test_confirmButtonClicked() {
        presenter.confirmButtonClicked()
        XCTAssertEqual(interactor.countCreateLoan, 1)
    }
    
    func test_deletebuttonClicked() {
        presenter.deletebuttonClicked()
        XCTAssertEqual(interactor.countDeleteLoan, 1)
    }

}
