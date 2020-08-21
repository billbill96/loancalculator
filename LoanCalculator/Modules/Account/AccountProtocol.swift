//
//  AccountProtocol.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol AccountViewProtocol: class {
    var presenter: AccountPresenterProtocol? { get set }
}

// MARK: Interactor
protocol AccountInteractorInputProtocol: class {
    var presenter: AccountPresenterProtocol? { get set }
}

protocol AccountInteractorOutputProtocol: class {
    
}

protocol AccountPresenterProtocol: class {
    var interactor: AccountInteractorInputProtocol? { get set }
    func viewDidLoaded()
}

protocol AccountRouterProtocol: class {
    var viewController: UIViewController? { get set }
}
