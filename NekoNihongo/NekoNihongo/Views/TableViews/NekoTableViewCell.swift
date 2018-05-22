//
//  NekoTableViewCell.swift
//  NekoNihongo
//
//  Created by Bao on 9/11/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

import UIKit

class NekoTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    
    @IBOutlet weak var nekoImageView: UIImageView!
    
    @IBOutlet weak var nekoNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
