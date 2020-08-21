//
//  AppConstant.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation
import UIKit

public enum ConstantApp {
    static let urlAPI = "https://loan-calculator.peerpower.co.th"
}

public enum AppColor {
    static let darkBlue = UIColor(rgb: 0x031143)
    static let lightBackgroud = UIColor(rgb: 0xEFEFF4)
    static let darkGrey = UIColor(rgb: 0x3C3C43)
    static let errorRed = UIColor(rgb: 0xFF3E3E)
    static let lightGrey = UIColor(rgb: 0xBEBEBE)
    static let mediumGrey = UIColor(rgb: 0x3C3C4399)
}

//ref: https://stackoverflow.com/a/24263296
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

extension UIButton {
    func setupBottomView(title: String) {
        self.setTitle(title, for: .normal)
        //TODO: set font
        self.backgroundColor = AppColor.darkBlue
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 5

    }
}
