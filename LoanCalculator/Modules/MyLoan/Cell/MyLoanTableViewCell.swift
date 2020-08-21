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
    }
    
    func setUpData() {
        
    }
    
}
