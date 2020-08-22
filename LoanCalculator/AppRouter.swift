//
//  AppRouter.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

protocol AppRouterProtocol: class {
    func goToLogin()
    func goToTab(account: UserModel, loanList: [LoanListModel])
}

class AppRouter: AppRouterProtocol {
    private let mainWindow: UIWindow
    private let loadingViewController: BaseViewProtocol
    
    init(mainWindow: UIWindow, loadingViewController: BaseViewProtocol) {
        self.mainWindow = mainWindow
        self.loadingViewController = loadingViewController
    }
    
    func goToLogin() {
        loadingViewController.activityStopAnimating()
        
        let module = LoginRouter.createModule()
        mainWindow.rootViewController = UINavigationController(rootViewController : module)
        mainWindow.makeKeyAndVisible()
    }
    
    func goToTab(account: UserModel, loanList: [LoanListModel]) {
        loadingViewController.activityStopAnimating()
        
        let accountModule = UINavigationController(rootViewController: AccountRouter.createModule(account: account))
        let myLoanModule = UINavigationController(rootViewController: MyLoanRouter.createModule(loanList: loanList))
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [myLoanModule, accountModule]
        let item1 = UITabBarItem(title: "MY LOAN", image: nil, tag: 0)
        let item2 = UITabBarItem(title: "ACCOUNT", image: nil, tag: 1)
        tabBarController.tabBar.barTintColor  = AppColor.darkBlue
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.isTranslucent = false
        myLoanModule.tabBarItem = item1
        accountModule.tabBarItem = item2

        mainWindow.rootViewController = tabBarController
        mainWindow.makeKeyAndVisible()
    }

}
