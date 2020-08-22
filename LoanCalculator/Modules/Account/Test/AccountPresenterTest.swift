//
//  AccountPresenterTest.swift
//  LoanCalculatorTests
//
//  Created by Supannee Mutitanon on 23/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import XCTest
import UIKit
@testable import LoanCalculator

class AccountPresenterTest: XCTestCase {

    var view: SpyAccountViewController!
    var interactor: SpyAccountInteractor!
    var router: SpyAccountRouter!
    var presenter: AccountPresenter!

    override func setUp() {
        view = SpyAccountViewController()
        interactor = SpyAccountInteractor()
        router = SpyAccountRouter()
        let mockModel = UserModel()
        presenter = AccountPresenter(view: view,
                                     interactor: interactor,
                                     router: router,
                                     account: mockModel)
    }

    func test_logoutButtonDidClicked() {
        presenter.logoutButtonDidClicked()
        XCTAssertEqual(router.countGoToLogin, 1)
    }
}
