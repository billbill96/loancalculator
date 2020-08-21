//
//  MyLoanProtocol.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol MyLoanViewProtocol: class {
    var presenter: MyLoanPresenterProtocol? { get set }
}

// MARK: Interactor
protocol MyLoanteractorInputProtocol: class {
    var presenter: MyLoanPresenterProtocol? { get set }
}

protocol MyLoanInteractorOutputProtocol: class {
    
}

protocol MyLoanPresenterProtocol: class {
    var interactor: MyLoanteractorInputProtocol? { get set }
    func viewDidLoaded()
}

protocol MyLoanRouterProtocol: class {
    var viewController: UIViewController? { get set }
}
