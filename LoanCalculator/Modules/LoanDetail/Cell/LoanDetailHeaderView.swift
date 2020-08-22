//
//  LoanDetailHeaderView.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 23/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

class LoanDetailHeaderView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var principalLabel: UILabel!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var pmtLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        setupView()
    }

    func loadNib() {
        Bundle.main.loadNibNamed("LoanDetailHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = CGRect(x: 0, y: -16, width: 320, height: 40)
    }
    
    func setupView() {
        noLabel.font = noLabel.font.withSize(12)
        dateLabel.font = dateLabel.font.withSize(12)
        principalLabel.font = principalLabel.font.withSize(12)
        interestLabel.font = interestLabel.font.withSize(12)
        pmtLabel.font = principalLabel.font.withSize(12)
        balanceLabel.font = principalLabel.font.withSize(12)
        
        noLabel.text = "No"
        dateLabel.text = "Date"
        principalLabel.text = "Priciple"
        pmtLabel.text = "PMT"
        interestLabel.text = "Interest"
        balanceLabel.text = "Balance"
    }

}
