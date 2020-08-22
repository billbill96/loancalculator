//
//  LoanDetailRouter.swift
//  
//
//  Created by Supannee Mutitanon on 22/8/20.
//

import Foundation
import UIKit

class LoanDetailRouter: LoanDetailRouterProtocol {
    var viewController: UIViewController?
    
    static func createModule(type: LoanDetailPageType,
                             loanData: LoanListModel,
                             dataRequest: CreateLoanRequest? = nil) -> UIViewController {
        let view = LoanDetailViewController()
        let interactor = LoanDetailInteractor()
        let router = LoanDetailRouter()
        let presenter = LoanDetailPresenter(view: view,
                                            interactor: interactor,
                                            router: router,
                                            type: type,
                                            loanData: loanData,
                                            dataRequest: dataRequest)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func goToEditLoan(loanId: Int) {
        let module = AddLoanRouter.createModule(type: .edit, loanId: loanId)
        viewController?.navigationController?.pushViewController(module, animated: true)
    }
    
    func goToMyLoan() {
        viewController?.navigationController?.popToViewController(ofClass: MyLoanViewController.self)
    }
}
