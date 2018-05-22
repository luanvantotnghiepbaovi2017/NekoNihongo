//
//  AlphabetOptionCollectionViewCell.swift
//  NekoNihongo
//
//  Created by Bao on 9/26/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

import UIKit

protocol AlphabetOptionDelegate: class {
    
    func selectAlphabetOption(cell: AlphabetOptionCollectionViewCell)
    
}

class AlphabetOptionCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var alphabetOptionLabel: UILabel!
    
    @IBOutlet weak var alphabetOptionImageView: UIImageView!
    
    
    // MARK: Variables
    
    weak var delegate: AlphabetOptionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectAlphabetOption))
        
        self.alphabetOptionLabel.addGestureRecognizer(tapGesture)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.delegate = nil
        
    }
    
    // MARK: Functions
    
    @objc func selectAlphabetOption() {
        
        self.delegate?.selectAlphabetOption(cell: self)
        
    }
    
}
