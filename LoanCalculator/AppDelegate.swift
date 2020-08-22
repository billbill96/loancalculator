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
        let firstViewController = BaseViewController()
        firstViewController.activityStartAnimating()
        self.window?.rootViewController = firstViewController
        self.window?.makeKeyAndVisible()
        
        let appStarter = AppStarter(window: self.window ?? UIWindow())
        appStarter.start()

        UINavigationBar.appearance().barTintColor = AppColor.darkBlue
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UITabBar.appearance().barTintColor = AppColor.darkBlue
        UITabBar.appearance().tintColor = .white
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
        
        IQKeyboardManager.shared().isEnabled = true
        
        return true
    }
}
