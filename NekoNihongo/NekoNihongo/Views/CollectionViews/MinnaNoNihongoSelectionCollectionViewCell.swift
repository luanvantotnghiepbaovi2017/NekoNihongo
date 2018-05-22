//
//  MinnaNoNihongoSelectionCollectionViewCell.swift
//  NekoNihongo
//
//  Created by Bao on 9/12/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

import UIKit

protocol MinnaNoNihongoSelectionCollectionViewCellDelegate: class {
    
    func selectMinnaNihongoLesson(cell: MinnaNoNihongoSelectionCollectionViewCell)
    
}

class MinnaNoNihongoSelectionCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var nekoMinnaNoNihongoSelectionLabel: UILabel!
    
    // MARK: Variables
    
    weak var delegate: MinnaNoNihongoSelectionCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.selectMinnaNihongoLesson))
        
        self.nekoMinnaNoNihongoSelectionLabel.addGestureRecognizer(tapGesture)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.delegate = nil
        
    }
    
    
    // MARK: Functions
    
    @objc func selectMinnaNihongoLesson() {
        
        self.delegate?.selectMinnaNihongoLesson(cell: self)
        
    }
    
}
