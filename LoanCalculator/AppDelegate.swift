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
        
        let account = AccountRouter.createModule()
        let myLoan = MyLoanRouter.createModule()
        
        var tabBarController = UITabBarController()
        tabBarController.viewControllers = [myLoan, account]
        //TODO: handle image
        var item1 = UITabBarItem(title: "MY LOAN", image: nil, tag: 0)
        var item2 = UITabBarItem(title: "ACCOUNT", image: nil, tag: 1)

        account.tabBarItem = item1
        myLoan.tabBarItem = item2

        let firstViewController = LoginRouter.createModule()
        self.window?.rootViewController = UINavigationController(rootViewController : firstViewController)
        self.window?.makeKeyAndVisible()
        
        IQKeyboardManager.shared().isEnabled = true
        
        return true
    }
}

extension AppDelegate {
    func checkToken() {
        //if can access -> tabbbar
        
        //else -> login
    }
}
