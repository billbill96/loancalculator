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
    
    @IBOutlet weak var loanTitleLabel: UILabel!
    @IBOutlet weak var loanAmountLabel: UILabel!
    @IBOutlet weak var loanTermLabel: UILabel!
    @IBOutlet weak var interestRateLabel: UILabel!
    @IBOutlet weak var bottomButton: UIButton!
    
    private var type: LoanDetailPageType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        
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
    func setupView(with type: LoanDetailPageType) {
        self.type = type
        let titleButton: String
        switch type {
        case .calculator:
            titleButton = "Confirm"
        case .detail:
            titleButton = "Edit"
        }
        bottomButton.setupBottomView(title: titleButton)
    }
}
