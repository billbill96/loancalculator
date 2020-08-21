//
//  MyLoanPresenter.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation

class MyLoanPresenter: MyLoanPresenterProtocol {
    weak var view: MyLoanViewProtocol?
    var interactor: MyLoanteractorInputProtocol?
    private let router: MyLoanRouterProtocol
    
    init(view: MyLoanViewProtocol?,
         interactor: MyLoanteractorInputProtocol?,
         router: MyLoanRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoaded() {
        //call service
    }
    
//    func didSelect
}

extension MyLoanPresenter: MyLoanInteractorOutputProtocol {
    
}
