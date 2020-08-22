//
//  LoanDetailInteractor.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation

class LoanDetailInteractor: LoanDetailteractorInputProtocol {
    var presenter: LoanDetailInteractorOutputProtocol?
    
    let dataManager: DataManagerProtocol
    init(dataManager: DataManagerProtocol = DataManager()) {
        self.dataManager = dataManager
    }
    
    func deleteLoan(loanId: String) {
        let request = LoanRequest(loanId: loanId)
        dataManager.deleteLoan(request: request).done { [weak self] _ in
            guard let self = self else { return }
            self.presenter?.deleteLoanSuccess()
        }.catch { [weak self] _ in
            guard let self = self else { return }
            self.presenter?.deleteLoanFail()
        }
        
    }
    
    func createLoan(request: CreateLoanRequest, type: AddLoanPageType) {        
        dataManager.createLoan(request: request, type: type).done { [weak self] model in
            guard let self = self else { return }
            self.presenter?.createLoanSuccess(model: model)
        }.catch { [weak self] error in
            guard let self = self else { return }
            self.presenter?.createLoanFail()
        }
    }

}
