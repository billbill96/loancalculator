//
//  LoanDetailTableViewCell.swift
//  LoanCalculator
//
//  Created by Supannee Mutitanon on 22/8/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import UIKit

class LoanDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellName = "LoanDetailCollectionViewCell"
    private let cellID = "loanDetailCollectionCell"
    
    private var data: RepaymentSchedules?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }
    
    private func setupView() {
        collectionView.register(UINib(nibName: cellName, bundle: nil),
                                forCellWithReuseIdentifier: cellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.isDirectionalLockEnabled = true
        collectionView.backgroundColor = .clear
    }
    
    func setupData(data: RepaymentSchedules) {
        self.data = data
        collectionView.reloadData()
    }
    
    private func reformatDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd/MM/YYYY"
        return dateFormatter.string(from: date ?? Date())
    }
}

extension LoanDetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        guard let detailCell = cell as? LoanDetailCollectionViewCell,
            let data = data else {
            return UICollectionViewCell()
        }

        switch indexPath.row {
        case 0:
            if let number = data.paymentNo {
                detailCell.setupData(data: "\(number)")
                detailCell.setLineView(hidden: false)
            }
        case 1:
            if let date = data.date  {
                detailCell.setupData(data: reformatDate(date: date)) 
                detailCell.setLineView(hidden: false)
            }
        case 2:
            if let principle = data.principal {
                detailCell.setupData(data: principle, isTwoDecimal: true)
                detailCell.setLineView(hidden: false)
            }
        case 3:
            if let interest = data.interest {
                detailCell.setupData(data: interest, isTwoDecimal: true)
                detailCell.setLineView(hidden: false)
            }
        case 4:
            if let paymentAmount = data.paymentAmount {
                detailCell.setupData(data: paymentAmount, isTwoDecimal: true)
                detailCell.setLineView(hidden: false)
            }
        case 5:
            if let balance = data.balance {
                detailCell.setupData(data: balance, isTwoDecimal: true)
                detailCell.setLineView(hidden: true)
            }
        default:
            break
        }
        
        return detailCell
    }
}

extension LoanDetailTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 40, height: 40)
        }
        return CGSize(width: 120, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
