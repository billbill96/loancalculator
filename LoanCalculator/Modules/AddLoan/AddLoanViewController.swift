//
//  AddLoanViewController.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

class AddLoanViewController: UIViewController, AddLoanViewProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var presenter: AddLoanPresenterProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}
