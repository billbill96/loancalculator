//
//  TextFieldView.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

public enum TextFieldType {
    case email
    case password
    case amount
    case interestRate
    
    var max: Int {
        switch self {
        case .amount:
            return 100000000
        case .interestRate:
            return 36
        default:
            return 0
        }
    }
    
    var min: Int {
        switch self {
        case .amount:
            return 1000
        case .interestRate:
            return 1
        default:
            return 0
        }
    }
}


class TextFieldView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
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
        Bundle.main.loadNibNamed("TextFieldView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 100)
    }
    
    func setupTextField(type: TextFieldType) {
        switch type {
        case .email:
            titleLabel.text = "Email"
            textField.placeholder = "Email"
            textField.keyboardType = .emailAddress
            errorLabel.text = ""
        case .password:
            titleLabel.text = "Password"
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
            errorLabel.text = ""
        case .amount:
            titleLabel.text = "Loan amount (Baht)"
            textField.keyboardType = .numberPad
            errorLabel.isHidden = true
        case .interestRate:
            titleLabel.text = "Interest rate (%)"
            textField.keyboardType = .numberPad
            errorLabel.isHidden = true
        }
    }
    
    func setupView() {
        titleLabel.font = titleLabel.font.withSize(14)
        titleLabel.textColor = AppColor.darkGrey
        errorLabel.font = errorLabel.font.withSize(13)
        resetTextField()
    }
    
    func textFieldError(reason: String) {
        titleLabel.textColor = AppColor.errorRed
        errorLabel.textColor = AppColor.errorRed
        textField.layer.borderColor = AppColor.errorRed.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 4
        textField.textColor = AppColor.errorRed
        errorLabel.text = reason
    }
    
    
    func resetTextField() {
        textField.text = ""
    }
    
    func getRawValueTextField() -> String? {
        return textField.text
    }
    
    func validateTextField(type: TextFieldType) -> Bool {
        guard let rawValue = getRawValueTextField(), !rawValue.isEmpty,
            let value = Int(rawValue)  else { return false }
        switch type {
        case .amount, .interestRate:
            return value >= type.min && value <= type.max
        default:
            break
        }
        return false
    }
}
