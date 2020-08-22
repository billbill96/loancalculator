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
    var loanData: LoanListModel
    
    let dataRequest: CreateLoanRequest?
    
    init(view: LoanDetailViewProtocol?,
         interactor: LoanDetailteractorInputProtocol?,
         router: LoanDetailRouterProtocol,
         type: LoanDetailPageType,
         loanData: LoanListModel,
         dataRequest: CreateLoanRequest?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.type = type
        self.loanData = loanData
        self.dataRequest = dataRequest
    }
    
    func viewDidLoaded() {
        view?.setupView(with: type, loanData)
    }
    
    func updateData(loanData: LoanListModel) {
        self.loanData = loanData
        view?.setupView(with: type, loanData)
        view?.reloadData()
    }
    
    func editButtonClicked() {
        guard let id = loanData.id else { return }
        router.goToEditLoan(loanId: id)
    }
    
    func confirmButtonClicked() {
        guard let dataRequest = dataRequest else { return }
        view?.activityStartAnimating()
        interactor?.createLoan(request: dataRequest, type: .add)
    }
    
    func deletebuttonClicked() {
        guard let id = loanData.id else { return }
        view?.activityStartAnimating()
        interactor?.deleteLoan(loanId: "\(id)")
    }
    
}

extension LoanDetailPresenter: LoanDetailInteractorOutputProtocol {
    func deleteLoanSuccess() {
        view?.activityStopAnimating()
        NotificationCenter.default.post(name: Notification.Name("ReloadMyLoan"), object: nil)
        router.goToMyLoan()
    }
    
    func deleteLoanFail() {
        view?.activityStopAnimating()
    }
    
    func createLoanSuccess(model: LoanListModel) {
        view?.activityStopAnimating()
        NotificationCenter.default.post(name: Notification.Name("ReloadMyLoan"), object: nil)
        router.goToMyLoan()
    }
    
    func createLoanFail() {
        view?.activityStopAnimating()
        view?.showPopUp(title: "api error createLoanFail")
    }
}
