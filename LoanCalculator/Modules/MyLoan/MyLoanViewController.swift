//
//  MyLoanViewController.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 21/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

class MyLoanViewController: UIViewController, MyLoanViewProtocol {
    var presenter: MyLoanPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var emptyImageView: UIImageView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    private let cellName = "MyLoanTableViewCell"
    private let cellID = "myLoanCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter?.viewDidLoaded()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupView() {
        navigationItem.title = "My Loan"
        navigationItem.hidesBackButton = true 
        self.navigationController?.navigationBar.topItem?.title = " "

        emptyView.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellID)
        
        let rightButtonItem = UIBarButtonItem(title: "+",
                                              style: .plain,
                                              target: self,
                                              action: #selector(rightButtonItemClicked))
        rightButtonItem.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor : UIColor.white,
        ], for: .normal)
        navigationItem.rightBarButtonItem = rightButtonItem
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reloadMyLoan),
                                               name: Notification.Name("ReloadMyLoan"),
                                               object: nil)
    }
    
    @objc func rightButtonItemClicked() {
        presenter?.addLoanClicked()
    }

    @objc func reloadMyLoan() {
        presenter?.reloadLoan()
    }
    
    func showEmptyView() {
        emptyView.isHidden = false
        emptyLabel.text = "No Data"
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension MyLoanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.loanList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        guard let myLoanCell = cell as? MyLoanTableViewCell, let loanData = presenter?.loanList[indexPath.row] else {
            debugPrint("load cell fail")
            return UITableViewCell()
        }
        myLoanCell.setUpData(data: loanData)
        return myLoanCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.loanClicked(index: indexPath.row)
    }
}
