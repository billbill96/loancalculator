//
//  LoanDetViewController.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit
import SnapKit

enum LoanDetailPageType {
    case calculator
    case detail
}

class LoanDetailViewController: UIViewController {
    var presenter: LoanDetailPresenterProtocol?
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var loanTitleLabel: UILabel!
    @IBOutlet weak var loanAmountLabel: UILabel!
    @IBOutlet weak var loanTermLabel: UILabel!
    @IBOutlet weak var interestRateLabel: UILabel!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var bageView: UIView!
    @IBOutlet weak var bageLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewRowWidth: NSLayoutConstraint!
    
    private var type: LoanDetailPageType?
    private let cellName = "LoanDetailTableViewCell"
    private let cellID = "loanDetailCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        presenter?.viewDidLoaded()
    }
    
    private func setupView() {
        backgroundView.backgroundColor = AppColor.lightBackgroud
        self.navigationController?.navigationBar.topItem?.title = " "
        
        loanTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        bottomButton.setupBottomView(title: "Edit")
        bageView.snp.makeConstraints { (make) in
            make.height.equalTo(0)
        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showBageView),
                                               name: Notification.Name("ShowBageView"),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reloadLoanDetail),
                                               name: Notification.Name("ReloadLoanDetail"),
                                               object: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellID)
        tableViewRowWidth.constant = 380 //TODO: dynamic thisss
        tableView.separatorStyle = .none
        tableView.layoutIfNeeded()
    }
    
    @objc private func showBageView() {
        bageView.backgroundColor = AppColor.green
        bageLabel.text = "Loan Edited"
        bageView.isHidden = false
        bageView.snp.makeConstraints { (make) in
            make.height.equalTo(40)
        }
    }
    
    private func setupRightBarButton() {
        let rightButtonItem = UIBarButtonItem(title: "Delete",
                                              style: .plain,
                                              target: self,
                                              action: #selector(deleteButtonClicked))
        rightButtonItem.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor.red,
        ], for: .normal)
        navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    @objc private func deleteButtonClicked() {
        let alertDelete = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            self.presenter?.deletebuttonClicked()
        }
        confirmAction.setValue(UIColor.red, forKey: "titleTextColor")
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertDelete.addAction(confirmAction)
        alertDelete.addAction(cancelAction)
        self.present(alertDelete, animated: true, completion: nil)
    }
    
    @objc private func reloadLoanDetail(notification: Notification) {
        if let data = notification.object as? LoanListModel {
            presenter?.updateData(loanData: data)
        }
    }

    @IBAction func buttonClicked(_ sender: Any) {
        guard let type = type else { return }
        
        switch type {
        case .calculator:
            let alert = UIAlertController(title: "Please Confirm",
                                          message: "Please confirm to create this loan",
                                          preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
                self.presenter?.confirmButtonClicked()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(confirmAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        case .detail:
            presenter?.editButtonClicked()
        }
    }
    
}

extension LoanDetailViewController: LoanDetailViewProtocol {
    func setupView(with type: LoanDetailPageType, _ data: LoanListModel) {
        guard let id = data.id, let amount = data.loanAmount, let term = data.loanTerm, let interestRate = data.interestRate else {
            return
        }
        self.type = type
        let titleButton: String
        switch type {
        case .calculator:
            titleButton = "Confirm"
            self.title = "Repayment Schedule Preview"
        case .detail:
            titleButton = "Edit"
            self.title = "Loan Detail"
            setupRightBarButton()
        }
        bottomButton.setupBottomView(title: titleButton)
        loanTitleLabel.text = "Loan #\(id)"
        loanAmountLabel.text = "Loan amount: ฿ \(amount)"
        loanTermLabel.text = "Loan term: \(term) Months"
        interestRateLabel.text = "Interest rate: \(interestRate)%"
    }
}

extension LoanDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let data = presenter?.loanData.repaymentSchedules else {
            return 0
        }
        return data.count //+ 1//for header view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        guard let detailCell = cell as? LoanDetailTableViewCell,
            let data = presenter?.loanData.repaymentSchedules?[indexPath.section] else {
            return UITableViewCell()
        }
        detailCell.backgroundColor = indexPath.section % 2 == 0 ? AppColor.lightBackgroud : .white
        detailCell.setupData(data: data, index: indexPath.section)
        return detailCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }    
}
