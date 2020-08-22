//
//  LoginProtocols.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol LoginViewProtocol: class {
    var presenter: LoginPresenterProtocol? { get set }
}

// MARK: Interactor
protocol LoginInteractorInputProtocol: class {
    var presenter: LoginInteractorOutputProtocol? { get set }
    func createToken(username: String, password: String)
    func getUser()
}

protocol LoginInteractorOutputProtocol: class {
    func createTokenSuccess(tokenModel: CreateTokenModel)
    func createTokenFail(error: Error)
    func getUserSuccess(model: UserModel)
}

protocol LoginPresenterProtocol: class {
    var interactor: LoginInteractorInputProtocol? { get set }
    func loginButtonDidClicked(username: String, password: String)
}

protocol LoginRouterProtocol: class {
    var viewController: UIViewController? { get set }
    func goToMyLoan(account: UserModel)
}
