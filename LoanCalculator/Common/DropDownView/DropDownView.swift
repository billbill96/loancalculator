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
    
    let pickerView = UIPickerView()
    var dropDownList: [Int] = []
    
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
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func setupDropDown(type: DropDownType) {
        switch type {
        case .year:
            titleLabel.text = "Loan Term (Years)"
            dropDownList = Array(1...36)
            textField.text = "\(dropDownList[0])"
        }
    }
    
    @IBAction func textFieldClicked(_ sender: UITextField) {
        sender.inputView = pickerView
    }
    
    func getRawValueTextField() -> String? {
        return textField.text
    }
}

extension DropDownView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dropDownList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(dropDownList[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = "\(dropDownList[row])"
    }
}
