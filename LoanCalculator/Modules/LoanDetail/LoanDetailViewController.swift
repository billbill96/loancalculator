//
//  LoanDetViewController.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

enum LoanDetailPageType {
    case calculator
    case detail
}

class LoanDetailViewController: UIViewController {
    var presenter: LoanDetailPresenterProtocol?
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var loanTitleLabel: UILabel!
    @IBOutlet weak var loanAmountLabel: UILabel!
    @IBOutlet weak var loanTermLabel: UILabel!
    @IBOutlet weak var interestRateLabel: UILabel!
    @IBOutlet weak var bottomButton: UIButton!
    
    private var type: LoanDetailPageType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        presenter?.viewDidLoaded()
    }
    
    private func setupView() {
        backgroundView.backgroundColor = AppColor.lightBackgroud
        bottomButton.setupBottomView(title: "Edit")
    }

    @IBAction func buttonClicked(_ sender: Any) {
        guard let type = type else { return }
        
        switch type {
        case .calculator:
            break
        case .detail:
            break
        }
    }
    
}

extension LoanDetailViewController: LoanDetailViewProtocol {
    func setupView(with type: LoanDetailPageType, _ data: LoanListModel) {
        guard let id = data.id, let amount = data.loanAmount, let term = data.loanTerm, let interestRate = data.interestRate else {
            return
        }
        self.type = type
        let titleButton: String
        switch type {
        case .calculator:
            titleButton = "Confirm"
        case .detail:
            titleButton = "Edit"
        }
        bottomButton.setupBottomView(title: titleButton)
        loanTitleLabel.text = "Loan #\(id)"
        loanAmountLabel.text = "Loan amount: ฿ \(amount)"
        loanTermLabel.text = "Loan term: \(term) Months"
        interestRateLabel.text = "Interest rate: \(interestRate)%"
    }
}
