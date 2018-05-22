//
//  FlashCardSelectionCollectionViewCell.swift
//  NekoNihongo
//
//  Created by Bao on 9/12/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

protocol FlashCardSelectionDelegate: class {
    func pushToFlashCardSwipeView(cell: FlashCardSelectionCollectionViewCell)
}

class FlashCardSelectionCollectionViewCell: UICollectionViewCell {
    // MARK: IBOutlets
    @IBOutlet weak var nekoFlashCardSelectionLabel: UILabel!
    // MARK: Properties
    weak var delegate: FlashCardSelectionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nekoTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.pushToFlashCardSwipeView))
        self.nekoFlashCardSelectionLabel.addGestureRecognizer(nekoTapGesture)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.delegate = nil
    }
    
    // MARK: Methods
    @objc func pushToFlashCardSwipeView() {
        self.delegate?.pushToFlashCardSwipeView(cell: self)
    }
    func configureCell(lessonOrderNumber: Int) {
        self.nekoFlashCardSelectionLabel.text = ""
        self.nekoFlashCardSelectionLabel.text = "\(lessonOrderNumber + 1)"
    }
}
