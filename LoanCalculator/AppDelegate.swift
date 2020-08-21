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
        let firstViewController = LoginRouter.createModule()
        self.window?.rootViewController = UINavigationController(rootViewController : firstViewController)
        self.window?.makeKeyAndVisible()
        
        IQKeyboardManager.shared().isEnabled = true
        
        return true
    }
}

