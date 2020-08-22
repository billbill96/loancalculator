//
//  MyLoanTableViewCell.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit
class MyLoanTableViewCell: UITableViewCell {

    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var interestRateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }

    private func setupCell() {
        //TODO: font
        selectionStyle = .none
        titelLabel.font = UIFont.boldSystemFont(ofSize: 16)
        amountLabel.font = amountLabel.font.withSize(14)
        termLabel.font = termLabel.font.withSize(14)
        interestRateLabel.font = interestRateLabel.font.withSize(14)
    }
    
    func setUpData(data: LoanListModel) {
        guard let id = data.id, let amount = data.loanAmount, let loanTerm = data.loanTerm, let interestRate = data.interestRate else { return }
        titelLabel.text = "Loan #\(id))"
        amountLabel.text = "Loan amoount: ฿ \(amount)" //TODO: check format
        termLabel.text = "Loan Term: \(loanTerm)"
        interestRateLabel.text = "Interest rate: \(interestRate) %"
    }
    
}
