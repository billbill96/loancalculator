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
    
    func loginButtonDidClicked(email: String, password: String) {
        //TODO: BILL call service
        router.goToMyLoan()
//        interactor?.createToken()
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    
}
