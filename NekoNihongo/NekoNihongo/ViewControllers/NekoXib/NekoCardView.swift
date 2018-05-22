//
//  NekoCardView.swift
//  NekoNihongo
//
//  Created by Bao on 9/12/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

class NekoCardView: UIView {
    // MARK: IBOutlets
    @IBOutlet weak var nekoFlashCardImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // MARK: Methods
    func setup() {
        // Shadow
        //        self.layer.shadowColor = UIColor.black.cgColor
        //        self.layer.shadowOpacity = 0.25
        //        self.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        //        self.layer.shadowRadius = 4.0
        //        self.layer.shouldRasterize = true
        //        self.layer.rasterizationScale = UIScreen.main.scale
        
        //        // Corner Radius
        //        layer.cornerRadius = 10.0;
    }
}
