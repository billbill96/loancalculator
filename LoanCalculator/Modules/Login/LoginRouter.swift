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
        let account = AccountRouter.createModule()
        let myLoan = MyLoanRouter.createModule()
        
        var tabBarController = UITabBarController()
        tabBarController.viewControllers = [myLoan, account]
        var item1 = UITabBarItem(title: "1st Tab", image: nil, tag: 0)
        var item2 = UITabBarItem(title: "2nd Tab", image: nil, tag: 1)

        account.tabBarItem = item1
        myLoan.tabBarItem = item2

//        let tabBarViewController = TabBarViewController()
//        tabBarViewController.selectedIndex = 0
//        let tabBarViewController = AccountRouter.createModule()
        viewController?.navigationController?.pushViewController(tabBarController, animated: true)
    }
}
