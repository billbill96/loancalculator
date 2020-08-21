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
    @IBOutlet weak var amountTextField: TextFieldView!
    @IBOutlet weak var yearDropDown: DropDownView!
    @IBOutlet weak var interestRateTextField: TextFieldView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    
    var presenter: AddLoanPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        presenter?.viewDidLoaded()
    }
    
    private func setupView() {
        self.title = "Add Loan"
        backgroundView.backgroundColor = AppColor.lightBackgroud
        
        titleLabel.text = "Loan Details"
        
        amountTextField.setupTextField(type: .amount)
        interestRateTextField.setupTextField(type: .interestRate)
        yearDropDown.setupDropDown(type: .year)
        
        addButton.setupBottomView(title: "Add")
    }


    @IBAction func addButtonClicked(_ sender: Any) {
        
    }
    
}
