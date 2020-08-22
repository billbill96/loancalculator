//
//  AppStater.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

protocol AppStarterProtocol: class {
    func start()
}

class AppStarter {
    
    private let appRouter: AppRouterProtocol
    
    init(window: UIWindow) {
        guard let rootViewController = window.rootViewController as? BaseViewProtocol else {
            fatalError()
        }
        appRouter = AppRouter(mainWindow: window, loadingViewController: rootViewController)
    }
    
    func start() {
        if UserDefaults.standard.string(forKey: "refreshToken") != nil {
            checkRefreshtoken()
        } else {
            appRouter.goToLogin()
        }
    }

    func handleRefreshTokenSuccess(model: RefreshTokenModel) {
        //TODO: change to keychain
        UserDefaults.standard.set(model.accessToken, forKey: "beaerToken")
        UserDefaults.standard.set(model.refreshToken, forKey: "refreshToken")
        getUser()
    }
}

extension AppStarter {
    func getUser() {
        DataManager().getUser().done {  model in
            self.getLoanList(account: model)
        }.catch { _ in
            //TODO: handle
            debugPrint("getUser fail")
        }
    }

    func getLoanList(account: UserModel) {
        DataManager().getLoanList().done {  model in
            self.appRouter.goToTab(account: account, loanList: model)
        }.catch { _ in
            //TODO: handle
            debugPrint("getLoanList fail")
        }
    }

    func checkRefreshtoken() {
        let refreshToken = UserDefaults.standard.string(forKey: "refreshToken") ?? ""
        let request = RefreshTokenReqeust(refreshToken: refreshToken)
        DataManager().refreshToken(request: request).done { model in
            self.handleRefreshTokenSuccess(model: model)
        }.catch { error in
            debugPrint("refresh token fail")
            self.appRouter.goToLogin()
        }
    }
}
