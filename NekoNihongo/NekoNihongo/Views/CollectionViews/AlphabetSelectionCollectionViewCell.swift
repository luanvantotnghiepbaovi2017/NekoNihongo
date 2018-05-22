//
//  AlphabetSelectionCollectionViewCell.swift
//  NekoNihongo
//
//  Created by Bao on 9/19/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

protocol AlphabetSelectionDelegate: class {
    func pushToAlphabetDetailView(cell: AlphabetSelectionCollectionViewCell)
}

class AlphabetSelectionCollectionViewCell: UICollectionViewCell {
    // MARK: IBOutlets
    @IBOutlet weak var alphabetLabel: UILabel!
    // MARK: Properties
    weak var delegate: AlphabetSelectionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nekoTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.pushToAlphabetDetailView))
        self.alphabetLabel.addGestureRecognizer(nekoTapGesture)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.delegate = nil
    }
    
    // MARK: Methods
    @objc func pushToAlphabetDetailView() {
        self.delegate?.pushToAlphabetDetailView(cell: self)
    }
}
