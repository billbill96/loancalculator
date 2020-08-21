//
//  LoanDetailRouter.swift
//  
//
//  Created by Supannee Mutitanon on 22/8/20.
//

import Foundation
import UIKit

class LoanDetailRouter: LoanDetailRouterProtocol {
    var viewController: UIViewController?
    
    static func createModule(type: LoanDetailPageType) -> UIViewController {
        let view = LoanDetailViewController()
        let interactor = LoanDetailInteractor()
        let router = LoanDetailRouter()
        let presenter = LoanDetailPresenter(view: view,
                                            interactor: interactor,
                                            router: router,
                                            type: type)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
