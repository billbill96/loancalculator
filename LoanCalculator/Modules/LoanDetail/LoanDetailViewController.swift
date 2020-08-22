//
//  LoanDetViewController.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit
import SwiftMessages

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
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewRowWidth: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var type: LoanDetailPageType?
    private let cellName = "LoanDetailTableViewCell"
    private let cellID = "loanDetailCell"
    var isShowBage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        presenter?.viewDidLoaded()
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableViewRowWidth.constant = 295 //TODO: dyanmic cell width
        tableView.layoutIfNeeded()
    }
    
    private func setupView() {
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        backgroundView.backgroundColor = AppColor.lightBackgroud
        loanTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        bottomButton.setupBottomView(title: "Edit")
        scrollView.layer.masksToBounds = true
        scrollView.layer.borderColor = UIColor.lightGray.cgColor
        scrollView.layer.borderWidth = 1

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
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    
    @objc private func showBageView() {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.success)
        view.configureContent(title: "Loan Edited", body: "")
        view.button?.isHidden = true
        SwiftMessages.show(view: view)
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
        if let data = notification.object as? LoanListModel, let type = self.type {
            presenter?.updateData(loanData: data)
            self.setupView(with: type , data)
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
            self.title = "Loan #\(id)"
            setupRightBarButton()
        }
        bottomButton.setupBottomView(title: titleButton)
        loanTitleLabel.text = "Loan #\(id)"
        loanAmountLabel.text = "Loan amount: ฿ \(amount)"
        loanTermLabel.text = "Loan term: \(term) Months"
        interestRateLabel.text = "Interest rate: \(interestRate)%"
    }
    
    func reloadData() {
        tableView.reloadData()
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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        guard let detailCell = cell as? LoanDetailTableViewCell,
            let data = presenter?.loanData.repaymentSchedules?[indexPath.section] else {
            return UITableViewCell()
        }
        detailCell.setupData(data: data)
        detailCell.backgroundColor = indexPath.section % 2 == 0 ? AppColor.lightBackgroud : .white
        return detailCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = LoanDetailHeaderView()
        return section == 0 ? view : UIView(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 40 : CGFloat.leastNormalMagnitude
    }
}
