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
    
    func setupProfile(data: UserModel, row: Int) {
        if row == 0 {
            titleLabel.text = "Name"
            dataLabel.text = data.name
        } else if row == 1 {
            titleLabel.text = "Email"
            dataLabel.text = data.email
        }
        
        dataLabel.textColor = AppColor.lightGrey
        selectionStyle = .none
    }
    
    func setupLogout() {
        titleLabel.textColor = AppColor.errorRed
        titleLabel.text = "Logout"
        dataLabel.isHidden = true
    }
}
