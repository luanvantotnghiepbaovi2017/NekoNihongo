//
//  MinnaNihongoDetailTableViewCell.swift
//  NekoNihongo
//
//  Created by Bao on 11/2/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

class MinnaNihongoDetailTableViewCell: UITableViewCell {
    // MARK: IBOutlets
    @IBOutlet weak var labelText01: UILabel!
    @IBOutlet weak var labelText02: UILabel!
    @IBOutlet weak var labelText03: UILabel!
    @IBOutlet weak var labelText04: UILabel!
    
    @IBOutlet weak var minnaNihongoOriginalLabel: UILabel!
    // MARK: Methods
    func configureCell(minnaLesson: NekoModel, rowIndex: Int) {
        let originalNumberString = "\(rowIndex + 1)"
        self.minnaNihongoOriginalLabel.text = originalNumberString
        labelText01.text = minnaLesson.nekoJapanese
        labelText02.text = minnaLesson.nekoKanji + " - " + minnaLesson.nekoKanjiHanViet
        labelText03.text = minnaLesson.nekoEnglish
        labelText04.text = minnaLesson.nekoVietNamese
        
//        labelText01.setLineSpacing(lineSpacing: 10.0)
//        labelText02.setLineSpacing(lineSpacing: 10.0)
//        labelText03.setLineSpacing(lineSpacing: 10.0)
//        labelText04.setLineSpacing(lineSpacing: 10.0)
    }
}
