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
    
    func goToMyLoan(account: UserModel, loanList: [LoanListModel]) {
        let accountModule = UINavigationController(rootViewController: AccountRouter.createModule(account: account))
        let myLoanModule = UINavigationController(rootViewController: MyLoanRouter.createModule(loanList: loanList))

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [myLoanModule, accountModule]
        let item1 = UITabBarItem(title: "MY LOAN", image: nil, tag: 0)
        let item2 = UITabBarItem(title: "ACCOUNT", image: nil, tag: 1)

        myLoanModule.tabBarItem = item1
        accountModule.tabBarItem = item2
        
        tabBarController.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.present(tabBarController, animated: true, completion: nil)
    }
}
