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
    
    static func createModule() -> UIViewController {
        let view = AddLoanViewController()
        let interactor = AddLoanInteractor()
        let router = AddLoanRouter()
        let presenter = AddLoanPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
