//
//  DropDownView.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

enum DropDownType {
    case year
}

class DropDownView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
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
        Bundle.main.loadNibNamed("DropDownView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 80)
    }
    
    private func setupView() {
        //set font
        //add arrow
        textField.tintColor = .clear
        titleLabel.font = titleLabel.font.withSize(14)
    }
    
    func setupDropDown(type: DropDownType) {
        switch type {
        case .year:
            titleLabel.text = "Loan Term (Years)"
        }
    }
    
    @IBAction func textFieldClicked(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        datePickerView.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        datePickerView.calendar = Calendar(identifier: .buddhist)
        datePickerView.locale = Locale(identifier: "th")

        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)

    }
    
        @objc func handleDatePicker(sender: UIDatePicker) {
            let dateFormatter = DateFormatter()
    //        dateFormatter.locale = Locale(identifier: "th")
            dateFormatter.setLocalizedDateFormatFromTemplate("MM/dd/yyyy")
            textField.text = dateFormatter.string(from: sender.date)
        }

    
}
