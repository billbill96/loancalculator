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
    private let headerCellID = "loanDetailHeaderCell"
    
    private var data: RepaymentSchedules?
    private var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }
    
    private func setupView() {
        collectionView.register(UINib(nibName: cellName, bundle: nil),
                                forCellWithReuseIdentifier: cellID)
        collectionView.register(UINib(nibName: cellName, bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerCellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.isDirectionalLockEnabled = true
    }
    
    func setupData(data: RepaymentSchedules, index: Int) {
        self.data = data
        self.index = index
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
            let data = data, let index = index else {
            return UICollectionViewCell()
        }

        switch indexPath.row {
        case 0:
            detailCell.setupData(data: "\(index+1)") //no
        case 1:
            guard let date = data.date else { return  UICollectionViewCell() }
            detailCell.setupData(data: reformatDate(date: date)) //date
        case 2:
            guard let principle = data.principal else { return UICollectionViewCell() }
            detailCell.setupData(data: principle, isTwoDecimal: true)
        case 3:
            guard let interest = data.interest else { return UICollectionViewCell() }
            detailCell.setupData(data: interest)
        case 4:
            guard let paymentAmount = data.paymentAmount else { return UICollectionViewCell() }
            detailCell.setupData(data: paymentAmount, isTwoDecimal: true)
        case 5:
            guard let balance = data.balance else { return UICollectionViewCell() }
            detailCell.setupData(data: balance)
        default:
            break
            
        }
        
        return detailCell
    }
    
    
}

extension LoanDetailTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 80, height: 40)
        }
        return CGSize(width: 100, height: 40)
    }

}
