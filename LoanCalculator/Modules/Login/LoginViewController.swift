//
//  LoginViewController.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var emailTextField: TextFieldView!
    @IBOutlet weak var passwordTextField: TextFieldView!
    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var keepMeLoginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Login")
        setupView()
        
    }

//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    func setupNavigationBar(title: String) {
        navigationController?.navigationBar.barTintColor = AppColor.darkBlue
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.title = title

    }
    
    private func setupView() {
        backgroundView.backgroundColor = AppColor.lightBackgroud
        emailTextField.setupTextField(type: .email)
        passwordTextField.setupTextField(type: .password)
        
        keepMeLoginLabel.text = "Keep me logged in"
        
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.backgroundColor = AppColor.darkBlue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 5
    }
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        guard let email = emailTextField.getRawValueTextField(), let password = emailTextField.getRawValueTextField() else { return }
        presenter?.loginButtonDidClicked(email: email, password: password)
    }
    
}


