//
//  AccountViewController.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, AccountViewProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: AccountPresenterProtocol?
    private let cellName = "AccountTableViewCell"
    private let cellID = "accountCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        title = "Account"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = AppColor.lightBackgroud
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellID)
//        tableView.tableFooterView = createFooterView()
    }
//
//    private func createFooterView() -> UIView {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
//        button.setTitle("Logout", for: .normal)
//        button.setTitleColor(.red, for: .normal)
//        button.addTarget(self, action: #selector(logoutButtonClicked), for: .touchUpInside)
//        view.addSubview(button)
//        return view
//
//    }
    @objc private func logoutButtonClicked() {
        
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        guard let accountCell = cell as? AccountTableViewCell else { return UITableViewCell() }
        switch indexPath.section {
        case 0 :
            accountCell.setupProfile()
        case 1:
            accountCell.setupLogout()
        default:
            break
        }
        return accountCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel(frame: CGRect(x: 16, y: 10, width: tableView.frame.width, height: 50))
        label.text = "MY PROFILE"
        label.font = label.font.withSize(13)
        label.textColor = AppColor.mediumGrey
        view.addSubview(label)
        return section == 0 ? view : UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 50 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
