//
//  AddLoanPresenter.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation

class AddLoanPresenter: AddLoanPresenterProtocol {
    weak var view: AddLoanViewProtocol?
    var interactor: AddLoannteractorInputProtocol?
    private let router: AddLoanRouterProtocol

    init(view: AddLoanViewProtocol?,
         interactor: AddLoannteractorInputProtocol?,
         router: AddLoanRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoaded() {
        
    }
    
    
}

extension AddLoanPresenter: AddLoanInteractorOutputProtocol {
    
}
