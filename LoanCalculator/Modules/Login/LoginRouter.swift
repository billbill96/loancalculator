//
//  LoginRouter.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = LoginViewController()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func goToMyLoan() {
        let tabBarViewController = TabBarViewController()
        viewController?.navigationController?.pushViewController(tabBarViewController, animated: true)
//        viewController?.navigationController?.present(tabBarViewController, animated: true, completion: nil)
        
    }
}
