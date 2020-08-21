//
//  AccountRouter.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

class AccountRouter: AccountRouterProtocol {
    var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = AccountViewController()
        let interactor = AccountInteractor()
        let router = AccountRouter()
        let presenter = AccountPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
