//
//  AccountTableViewCell.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupProfile() {
        dataLabel.textColor = AppColor.lightGrey
    }
    
    func setupLogout() {
        titleLabel.textColor = AppColor.errorRed
        dataLabel.text = "Logout"
    }
    
}
