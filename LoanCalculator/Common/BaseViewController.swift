//
//  BaseViewController.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

protocol BaseViewProtocol: UIViewController {
    func activityStartAnimating()
    func activityStopAnimating()
    func showPopUp(title: String)
}

extension BaseViewProtocol {
    func activityStartAnimating() {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0,
                                           y: 0,
                                           width: self.view.frame.width,
                                           height: self.view.frame.height)
        backgroundView.backgroundColor = .lightGray
        backgroundView.tag = 9999
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false

        backgroundView.addSubview(activityIndicator)

        self.view.addSubview(backgroundView)
    }

    func activityStopAnimating() {
        if let background = view.viewWithTag(9999){
            background.removeFromSuperview()
        }
        self.view.isUserInteractionEnabled = true
    }
    
    func showPopUp(title: String) {
        let alert = UIAlertController(title: title,
                                            message: nil,
                                            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

class BaseViewController: UIViewController, BaseViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
