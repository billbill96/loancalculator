//
//  MyLoanRouter.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

class MyLoanRouter: MyLoanRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule(loanList: [LoanListModel]) -> UIViewController {
        let view = MyLoanViewController()
        let interactor = MyLoanInteractor()
        let router = MyLoanRouter()
        let presenter = MyLoanPresenter(view: view,
                                        interactor: interactor,
                                        router: router,
                                        loanList: loanList)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func goToLoanDetail(loanData: LoanListModel) {
        let module = LoanDetailRouter.createModule(type: .detail, loanData: loanData)
        module.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(module, animated: true)
    }
    
    func goToAddLoan() {
        let module = AddLoanRouter.createModule()
        module.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(module, animated: true)
    }
}
