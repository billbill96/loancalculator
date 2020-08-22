//
//  LoginPresenterTest.swift
//  LoanCalculatorTests
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import LoanCalculator

class LoginPresenterTest: XCTestCase {
    
    var view: SpyLoginViewController!
    var interactor: SpyLoginInteractor!
    var router: SpyLoginRouter!
    var presenter: LoginPresenter!
    
    override func setUp() {
        view = SpyLoginViewController()
        interactor = SpyLoginInteractor()
        router = SpyLoginRouter()
        presenter = LoginPresenter(view: view,
                                   interactor: interactor,
                                   router: router)
        
    }
    
    func test_loginButtonDidClicked() {
        presenter.loginButtonDidClicked(username: "bob@peerpower.co.th", password: "1")
        XCTAssertEqual(interactor.countCreateToken, 1)
    }
    
}

class LoginInteractorTest: XCTestCase {
    func test_createTokenSuccess() {
        
    }
}
