//
//  AppDelegate.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow()
        
        //TODO: splash screen
        let firstViewController = LoginRouter.createModule()
        self.window?.rootViewController = UINavigationController(rootViewController : firstViewController)
        self.window?.makeKeyAndVisible()
        checkToken()

        UINavigationBar.appearance().barTintColor = AppColor.darkBlue
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]

        IQKeyboardManager.shared().isEnabled = true
        
        return true
    }
}

extension AppDelegate {
    func checkToken() {
        if UserDefaults.standard.string(forKey: "beaerToken") != nil {
            getUser()
        } else {
            self.window = UIWindow()
            let firstViewController = LoginRouter.createModule()
            self.window?.rootViewController = UINavigationController(rootViewController : firstViewController)
            self.window?.makeKeyAndVisible()
        }
    }
    
    func goToTab(account: UserModel, loanList: [LoanListModel]) {
        self.window = UIWindow()
        let account = UINavigationController(rootViewController: AccountRouter.createModule(account: account))
        let myLoan = UINavigationController(rootViewController: MyLoanRouter.createModule(loanList: loanList))
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [myLoan, account]
        let item1 = UITabBarItem(title: "MY LOAN", image: nil, tag: 0)
        let item2 = UITabBarItem(title: "ACCOUNT", image: nil, tag: 1)
        tabBarController.tabBar.barTintColor  = AppColor.darkBlue
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.isTranslucent = false
        
        myLoan.tabBarItem = item1
        account.tabBarItem = item2

        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()

    }
    
    func getUser() {
        DataManager().getUser().done { [weak self] model in
            guard let self = self else { return }
            self.getLoanList(account: model)
        }.catch { [weak self] error in
            guard let self = self else { return }
            
        }
    }
    
    func getLoanList(account: UserModel) {
        DataManager().getLoanList().done { [weak self] model in
            guard let self = self else { return }
            self.goToTab(account: account, loanList: model)
        }.catch { [weak self] error in
            guard let self = self else { return }
            
            }
    }
}
