//
//  AccountViewPresenter.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation

class AccountPresenter: AccountPresenterProtocol {
    weak var view: AccountViewProtocol?
    var interactor: AccountInteractorInputProtocol?
    private let router: AccountRouterProtocol
    
    let account: UserModel
    init(view: AccountViewProtocol?,
         interactor: AccountInteractorInputProtocol?,
         router: AccountRouterProtocol,
         account: UserModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.account = account
    }
    
    func viewDidLoaded() {
        
    }
    
    func logoutButtonClicked() {
        //clear toekn
        //popto login
    }
    
    
}

extension AccountPresenter: AccountInteractorOutputProtocol {
    
}
