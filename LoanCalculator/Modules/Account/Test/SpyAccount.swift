//
//  SpyAccount.swift
//  
//
//  Created by Supannee Mutitanon on 23/8/20.
//

import Foundation
import UIKit
@testable import LoanCalculator

class SpyAccountViewController: UIViewController, AccountViewProtocol {
    var presenter: AccountPresenterProtocol?
    
    
}

class SpyAccountInteractor: AccountInteractorInputProtocol {
    var presenter: AccountPresenterProtocol?
    
    
}

class SpyAccountRouter: AccountRouterProtocol {
    var viewController: UIViewController?
    var countGoToLogin = 0
    
    func goToLogin() {
        countGoToLogin += 1
    }
    
    
}
