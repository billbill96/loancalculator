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

    let type: AddLoanPageType
    let loanId: Int?
    
    init(view: AddLoanViewProtocol?,
         interactor: AddLoannteractorInputProtocol?,
         router: AddLoanRouterProtocol,
         type: AddLoanPageType,
         loanId: Int?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.type = type
        self.loanId = loanId
    }
    
    func viewDidLoaded() {
        view?.setupData(type: type)
    }
    
    func addButtonClicked(amount: String, term: String, rate: String) {
        guard let amount = Int(amount), let term = Int(term), let rate = Int(rate) else {
            return
        }
        view?.activityStartAnimating()
        switch type {
        case .add:
            interactor?.getLoanPreview(amount: amount, term: term, rate: rate)
        case .edit:
            guard let loanId = loanId else { return }
            interactor?.editLoan(amount: amount, term: term, rate: rate, loadId: loanId)
        }
    }
}

extension AddLoanPresenter: AddLoanInteractorOutputProtocol {
    func editLoanSuccess(model: LoanListModel) {
        view?.activityStopAnimating()
        NotificationCenter.default.post(name: Notification.Name("ShowBageView"), object: nil)
        NotificationCenter.default.post(name: Notification.Name("ReloadLoanDetail"), object: model)
        NotificationCenter.default.post(name: Notification.Name("ReloadMyLoan"), object: nil)
        router.goToLoanDetail()
    }
    
    func editLoanFail(error: Error) {
        view?.activityStopAnimating()
        view?.showPopUp(title: "api error editLoanFail")
    }
    
    func getLoanPreviewSuccess(dataRequest: CreateLoanRequest, model: LoanListModel) {
        view?.activityStopAnimating()
        router.goToLoanDetail(dataRequest: dataRequest, model: model)
        
    }
    
    func getLoanPreviewFail() {
        view?.activityStopAnimating()
        view?.showPopUp(title: "api error getLoanPreviewFail")
    }
}
