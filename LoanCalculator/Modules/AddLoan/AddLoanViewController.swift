//
//  AddLoanViewController.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

enum AddLoanPageType {
    case add
    case edit
}

class AddLoanViewController: UIViewController {
    
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
        backgroundView.backgroundColor = AppColor.lightBackgroud
        self.navigationController?.navigationBar.topItem?.title = " "
        
        titleLabel.text = "Loan Details"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        amountTextField.setupTextField(type: .amount)
        interestRateTextField.setupTextField(type: .interestRate)
        yearDropDown.setupDropDown(type: .year)
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        guard let amount = amountTextField.getRawValueTextField(),
            let interestRate = interestRateTextField.getRawValueTextField(),
            let term = yearDropDown.getRawValueTextField() else { return }
        
        let alertDelete = UIAlertController(title: "Please Confirm",
                                            message: "Please confirm to create this loan",
                                            preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            self.presenter?.addButtonClicked(amount: amount, term: term, rate: interestRate)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertDelete.addAction(confirmAction)
        alertDelete.addAction(cancelAction)
        self.present(alertDelete, animated: true, completion: nil)
    }
}

extension AddLoanViewController: AddLoanViewProtocol {
    func setupData(type: AddLoanPageType) {
        switch type {
        case .add:
            self.title = "Add Loan"
            addButton.setupBottomView(title: "Add")
        case .edit:
            self.title = "Edit loan detail"
            addButton.setupBottomView(title: "Edit")
        }
    }
}
