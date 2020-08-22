//
//  AddLoanRouter.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

class AddLoanRouter: AddLoanRouterProtocol {
    var viewController: UIViewController?
    
    static func createModule(type: AddLoanPageType,
                             loanId: Int?) -> UIViewController {
        let view = AddLoanViewController()
        let interactor = AddLoanInteractor()
        let router = AddLoanRouter()
        let presenter = AddLoanPresenter(view: view,
                                         interactor: interactor,
                                         router: router,
                                         type: type,
                                         loanId: loanId)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func goToLoanDetail(model: LoanListModel) {
        let module = LoanDetailRouter.createModule(type: .calculator, loanData: model)
        viewController?.navigationController?.pushViewController(module, animated: true)
    }
    
    func goToMyLoan() {
        viewController?.navigationController?.popToViewController(ofClass: MyLoanViewController.self)
    }
    
    func goToLoanDetail() {
        viewController?.navigationController?.popToViewController(ofClass: LoanDetailViewController.self)
    }
}
