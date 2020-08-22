//
//  MyLoanInteractor.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import Alamofire

class MyLoanInteractor: MyLoanteractorInputProtocol {
    var presenter: MyLoanInteractorOutputProtocol?
    
    let dataManager: DataManagerProtocol
    init(dataManager: DataManagerProtocol = DataManager()) {
        self.dataManager = dataManager
    }

    func getLoanList() {
        dataManager.getLoanList().done { [weak self] model in
            guard let self = self else { return }
            self.presenter?.getLoanListSuccess(loanList: model)
        }.catch { [weak self] error in
            guard let self = self else { return }
            self.presenter?.getLoanListFail()
        }
    }
}
