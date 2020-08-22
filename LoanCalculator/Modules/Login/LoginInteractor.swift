//
//  LoginInteractor.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class LoginInteractor: LoginInteractorInputProtocol {
    var presenter: LoginInteractorOutputProtocol?
    
    let dataManager: DataManagerProtocol
    init(dataManager: DataManagerProtocol = DataManager()) {
        self.dataManager = dataManager
    }
    
    func createToken(username: String, password: String) {
        let request = CreateTokenRequest(username: username, password: password)
        dataManager.createToken(request: request).done { [weak self] model in
            guard let self = self else { return }
            self.presenter?.createTokenSuccess(tokenModel: model)
        }.catch { [weak self] error in
            guard let self = self else { return }
            self.presenter?.createTokenFail(error: error)
        }
    }
    
    func getUser() {
        dataManager.getUser().done { [weak self] model in
            guard let self = self else { return }
            self.presenter?.getUserSuccess(model: model)
        }.catch { [weak self] error in
            guard let self = self else { return }
            self.presenter?.getUserFail()
        }
    }
    
    func getLoanList(account: UserModel) {
        dataManager.getLoanList().done { [weak self] model in
            guard let self = self else { return }
            self.presenter?.getLoanListSuccess(account: account, loanList: model)
        }.catch { [weak self] error in
            guard let self = self else { return }
            self.presenter?.getLoanListFail()
        }
    }
}
