//
//  LoanDetailProtocol.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

// MARK: View
protocol LoanDetailViewProtocol: class {
    var presenter: LoanDetailPresenterProtocol? { get set }
    func setupView(with type: LoanDetailPageType)
}

// MARK: Interactor
protocol LoanDetailteractorInputProtocol: class {
    var presenter: LoanDetailPresenterProtocol? { get set }
}

protocol LoanDetailInteractorOutputProtocol: class {
    
}

protocol LoanDetailPresenterProtocol: class {
    var interactor: LoanDetailteractorInputProtocol? { get set }
    func viewDidLoaded()
}

protocol LoanDetailRouterProtocol: class {
    var viewController: UIViewController? { get set }
}
