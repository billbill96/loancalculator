//
//  LoanDetailCollectionViewCell.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

class LoanDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func prepareForReuse() {
         super.prepareForReuse()
    }
    
    func setupData(data: String, isTwoDecimal: Bool = false) {
        if let data = Double(data), isTwoDecimal {
            let double = String(format: "%.2f", data)
            titleLabel.text = double
        } else {
            titleLabel.text = data
        }
        
        titleLabel.font = titleLabel.font.withSize(12)
    }

    func setLineView(hidden: Bool) {
        lineView.isHidden = hidden
    }
}
