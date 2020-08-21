//
//  LoanDetailPresenter.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation

class LoanDetailPresenter: LoanDetailPresenterProtocol {

    weak var view: LoanDetailViewProtocol?
    var interactor: LoanDetailteractorInputProtocol?
    private let router: LoanDetailRouterProtocol

    private let type: LoanDetailPageType
    
    init(view: LoanDetailViewProtocol?,
         interactor: LoanDetailteractorInputProtocol?,
         router: LoanDetailRouterProtocol,
         type: LoanDetailPageType) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.type = type
    }
    
    func viewDidLoaded() {
        view?.setupView(with: type)
    }
    
    
}

extension LoanDetailPresenter: LoanDetailInteractorOutputProtocol {
    
}
