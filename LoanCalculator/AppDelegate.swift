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
        checkRoute()

        UINavigationBar.appearance().barTintColor = AppColor.darkBlue
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]

        IQKeyboardManager.shared().isEnabled = true
        
        return true
    }
}

extension AppDelegate {
    func checkRoute() {
        if UserDefaults.standard.string(forKey: "beaerToken") != nil {
            checkRefreshtoken()
        } else {
            if let viewController = window?.rootViewController as? BaseViewController {
                viewController.activityStopAnimating()
            }
            goToLogin()
        }
    }
    
    func goToLogin() {
        if let viewController = window?.rootViewController as? BaseViewController {
            viewController.activityStopAnimating()
        }
        
        self.window = UIWindow()
        let module = LoginRouter.createModule()
        self.window?.rootViewController = UINavigationController(rootViewController : module)
        self.window?.makeKeyAndVisible()
    }
    
    func goToTab(account: UserModel, loanList: [LoanListModel]) {
        if let viewController = window?.rootViewController as? BaseViewController {
            viewController.activityStopAnimating()
        }
        self.window = UIWindow()
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

        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }
    
    func getUser() {
        DataManager().getUser().done { [weak self] model in
            guard let self = self else { return }
            self.getLoanList(account: model)
        }.catch { _ in
            //TODO: handle
        }
    }

    func getLoanList(account: UserModel) {
        DataManager().getLoanList().done { [weak self] model in
            guard let self = self else { return }
            self.goToTab(account: account, loanList: model)
        }.catch { _ in
            //TODO: handle
        }
    }
    
    func handleRefreshTokenSuccess(model: RefreshTokenModel) {
        //TODO: change to keychain
        UserDefaults.standard.set(model.accessToken, forKey: "beaerToken")
        UserDefaults.standard.set(model.refreshToken, forKey: "refreshToken")
        getUser()
    }

    func checkRefreshtoken() {
        let refreshToken = UserDefaults.standard.string(forKey: "refreshToken") ?? ""
        let request = RefreshTokenReqeust(refreshToken: refreshToken)
        DataManager().refreshToken(request: request).done { [weak self] model in
            guard let self = self else { return }
            self.handleRefreshTokenSuccess(model: model)
        }.catch { [weak self] error in
            guard let self = self else { return }
            debugPrint("refresh token fail")
            self.goToLogin()
        }
    }
}
