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
    
    private func setupView() {
        self.title = "My Loan"
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        emptyView.isHidden = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellID)
        
        let rightButtonItem = UIBarButtonItem(image: UIImage(named: ""),
                                              style: .plain,
                                              target: self,
                                              action: #selector(rightButtonItemClicked))
        navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    private func setupEmptyView() {
        emptyLabel.text = "No Data"
    }
    
    @objc func rightButtonItemClicked() {
        //TODO: GOTO ADD
        print("right bar button")
    }
}

extension MyLoanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        guard let myLoanCell = cell as? MyLoanTableViewCell else {
            debugPrint("load cell fail")
            return UITableViewCell()
        }
        return myLoanCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
