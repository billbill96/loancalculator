//
//  LoginPresenter.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation


class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    private let router: LoginRouterProtocol
    
    init(view: LoginViewProtocol?,
         interactor: LoginInteractorInputProtocol?,
         router: LoginRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loginButtonDidClicked(username: String, password: String) {
        interactor?.createToken(username: username, password: password)
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    func createTokenSuccess(tokenModel: CreateTokenModel) {
        print("YEAHHHHH")
    }
    
    func createTokenFail(error: Error) {
        print("faill")
    }
}
