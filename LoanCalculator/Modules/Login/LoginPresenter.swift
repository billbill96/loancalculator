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
        view?.activityStartAnimating()
        interactor?.createToken(username: username, password: password)
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    func createTokenSuccess(tokenModel: CreateTokenModel) {
        //TODO: change to keychain, move to common
        UserDefaults.standard.set(tokenModel.accessToken, forKey: "beaerToken")
        if UserDefaults.standard.bool(forKey: "KeepMeLogin") {
            UserDefaults.standard.set(tokenModel.refreshToken, forKey: "refreshToken")
        }
        interactor?.getUser()
    }
    
    func createTokenFail(error: Error) {
        view?.activityStopAnimating()
    }
    
    func getUserSuccess(model: UserModel) {
        interactor?.getLoanList(account: model)
    }
    
    func getUserFail() {
        //TODO: handle
        view?.activityStopAnimating()
    }
    
    func getLoanListSuccess(account: UserModel, loanList: [LoanListModel]) {
        view?.activityStopAnimating()
        router.goToMyLoan(account: account, loanList: loanList)
    }
    
    func getLoanListFail() {
        view?.activityStopAnimating()
    }
}
