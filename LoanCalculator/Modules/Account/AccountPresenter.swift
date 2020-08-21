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
    
    init(view: AccountViewProtocol?,
         interactor: AccountInteractorInputProtocol?,
         router: AccountRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoaded() {
        
    }
    
    
}

extension AccountPresenter: AccountInteractorOutputProtocol {
    
}
