//
//  AddLoanProtocols.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol AddLoanViewProtocol: class {
    var presenter: AddLoanPresenterProtocol? { get set }
}

// MARK: Interactor
protocol AddLoannteractorInputProtocol: class {
    var presenter: AddLoanPresenterProtocol? { get set }
}

protocol AddLoanInteractorOutputProtocol: class {
    
}

protocol AddLoanPresenterProtocol: class {
    var interactor: AddLoannteractorInputProtocol? { get set }
    func viewDidLoaded()
}

protocol AddLoanRouterProtocol: class {
    var viewController: UIViewController? { get set }
}
