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
    
    func goToMyLoan(account: UserModel) {
//        let account = AccountRouter.createModule(account: account)
//        let myLoan = MyLoanRouter.createModule()
//        
//        let tabBarController = UITabBarController()
//        tabBarController.viewControllers = [myLoan, account]
//        let item1 = UITabBarItem(title: "MY LOAN", image: nil, tag: 0)
//        let item2 = UITabBarItem(title: "ACCOUNT", image: nil, tag: 1)
//
//        myLoan.tabBarItem = item1
//        account.tabBarItem = item2
//
//        viewController?.navigationController?.pushViewController(tabBarController, animated: true)
    }
}
