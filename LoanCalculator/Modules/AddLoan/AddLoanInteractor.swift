//
//  AddLoanInteractor.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation

class AddLoanInteractor: AddLoannteractorInputProtocol {
    var presenter: AddLoanInteractorOutputProtocol?
    
    let dataManager: DataManagerProtocol
    init(dataManager: DataManagerProtocol = DataManager()) {
        self.dataManager = dataManager
    }
    
    func editLoan(amount: Int, term: Int, rate: Int, loadId: Int) {
        let date = Date()
        let calendar = Calendar(identifier: .gregorian)
        let currentYear = calendar.component(.year, from: date)
        let currentMonth = calendar.component(.month, from: date)

        let request = CreateLoanRequest(loadId: loadId,
                                        loanAmount: amount,
                                        loanTerm: term,
                                        interestRate: rate,
                                        startMonth: currentMonth,
                                        startYear: currentYear)
        
        dataManager.createLoan(request: request, type: .edit).done { [weak self] model in
            guard let self = self else { return }
            self.presenter?.editLoanSuccess(model: model)
        }.catch { [weak self] error in
            guard let self = self else { return }
            self.presenter?.editLoanFail(error: error)
        }
    }
    
    func getLoanPreview(amount: Int, term: Int, rate: Int) {
        let date = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: date)
        let currentMonth = calendar.component(.month, from: date)

        let request = CreateLoanRequest(loadId: nil,
                                        loanAmount: amount,
                                        loanTerm: term,
                                        interestRate: rate,
                                        startMonth: currentMonth,
                                        startYear: currentYear)
        
        dataManager.getLoanPreview(request: request).done { [weak self] model in
            guard let self = self else { return }
            self.presenter?.getLoanPreviewSuccess(dataRequest: request, model: model)
        }.catch { [weak self] error in
            guard let self = self else { return }
            self.presenter?.getLoanPreviewFail()
        }

    }
}
