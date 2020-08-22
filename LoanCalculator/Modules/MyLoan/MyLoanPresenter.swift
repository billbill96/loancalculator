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
    
    var loanList: [LoanListModel]
    
    init(view: MyLoanViewProtocol?,
         interactor: MyLoanteractorInputProtocol?,
         router: MyLoanRouterProtocol,
         loanList: [LoanListModel]) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.loanList = loanList
    }

    func viewDidLoaded() {
        if loanList.isEmpty {
            view?.showEmptyView()
        }
        view?.reloadData()
    }
    
    func loanClicked(index: Int) {
        router.goToLoanDetail(loanData: loanList[index])
    }
    
    func addLoanClicked() {
        router.goToAddLoan()
    }
    
    func reloadLoan() {
        view?.activityStartAnimating()
        interactor?.getLoanList()
    }
}

extension MyLoanPresenter: MyLoanInteractorOutputProtocol {
    func getLoanListSuccess(loanList: [LoanListModel]) {
        view?.activityStopAnimating()
        self.loanList = loanList
        view?.reloadData()
    }
    
    func getLoanListFail() {
        view?.activityStopAnimating()
        view?.showPopUp(title: "api error get loanlistfail")
    }
}
