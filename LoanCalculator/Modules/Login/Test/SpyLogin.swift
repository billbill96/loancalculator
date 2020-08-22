//
//  SpyLogin.swift
//  LoanCalculatorTests
//
//  Created by Supannee Mutitanon on 23/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import LoanCalculator

class SpyLoginViewController: UIViewController, LoginViewProtocol {
    var presenter: LoginPresenterProtocol?
    
}

class SpyLoginInteractor: LoginInteractorInputProtocol {
    var presenter: LoginInteractorOutputProtocol?
    
    var countCreateToken = 0
    var countGetUser = 0
    var countGetLoanList = 0
    
    func createToken(username: String, password: String) {
        countCreateToken += 1
    }
    
    func getUser() {
        countGetUser += 1
    }
    
    func getLoanList(account: UserModel) {
        countGetLoanList += 1
    }
    
    
}

class SpyLoginRouter: LoginRouterProtocol {
    var viewController: UIViewController?
    
    var countGotoMyLoan = 0
    func goToMyLoan(account: UserModel, loanList: [LoanListModel]) {
        countGotoMyLoan += 1
    }
}

class SpyLoginPresenter: LoginInteractorOutputProtocol {
    var countCreateTokenSuccess = 0
    var coutnCreateTokenFail = 0
    var countGetUerSuccess = 0
    var countGetUserFail = 0
    var countGetLoanListSuccess = 0
    var countGetLoanListFail = 0
    
    let expect: XCTestExpectation?
    init(expect: XCTestExpectation? = nil) {
        self.expect = expect
    }
    
    func createTokenSuccess(tokenModel: CreateTokenModel) {
        countCreateTokenSuccess += 1
    }
    
    func createTokenFail(error: Error) {
        coutnCreateTokenFail += 1
    }
    
    func getUserSuccess(model: UserModel) {
        countGetUerSuccess += 1
    }
    
    func getUserFail() {
        countGetUserFail += 1
    }
    
    func getLoanListSuccess(account: UserModel, loanList: [LoanListModel]) {
        countGetLoanListSuccess += 1
    }
    
    func getLoanListFail() {
        countGetLoanListFail += 1
    }
}
