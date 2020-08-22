//
//  LoginViewController.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var emailTextField: TextFieldView!
    @IBOutlet weak var passwordTextField: TextFieldView!
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var keepMeLoginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    private func setupView() {
        title = "Login"
        navigationController?.navigationBar.barTintColor = AppColor.darkBlue
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        backgroundView.backgroundColor = AppColor.lightBackgroud
        emailTextField.setupTextField(type: .email)
        passwordTextField.setupTextField(type: .password)
        
        keepMeLoginLabel.text = "Keep me logged in"
        keepMeLoginLabel.font = keepMeLoginLabel.font.withSize(14)
        checkboxButton.setImage(UIImage(named: ""), for: .normal)
        checkboxButton.setImage(UIImage(named: ""), for: .selected)
        
        loginButton.setupBottomView(title: "LOGIN")
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        guard let email = validateEmailTextField(), let password = validatePasswordTextField() else {
            return
        }
        UserDefaults.standard.set(checkboxButton.isSelected, forKey: "KeepMeLogin")
        presenter?.loginButtonDidClicked(username: email, password: password)
    }
    
    @IBAction func keepMeLoginButtonClicked(_ sender: Any) {
        checkboxButton.isSelected = !checkboxButton.isSelected
    }
    
    private func validateEmailTextField() -> String? {
        guard let email = emailTextField.getRawValueTextField(), !email.isEmpty else {
            emailTextField.textFieldError(reason: "please enter email")
            return nil
        }
        
        if !isValidEmail(email) {
            emailTextField.textFieldError(reason: "please enter valid email")
            return nil
        }
        return email
    }
    
    private func validatePasswordTextField() -> String? {
        guard let password = passwordTextField.getRawValueTextField(), !password.isEmpty else {
            emailTextField.textFieldError(reason: "please enter password")
            return nil
        }
        return password
    }
    
    //https://stackoverflow.com/a/25471164
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}


extension LoginViewController: LoginViewProtocol {
    
}
