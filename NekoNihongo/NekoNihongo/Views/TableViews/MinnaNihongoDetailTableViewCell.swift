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
    @IBOutlet weak var minnaNihongoDetailLabel: UILabel!
    @IBOutlet weak var minnaNihongoOriginalLabel: UILabel!
    // MARK: Methods
    func configureCell(minnaLesson: NekoModel, rowIndex: Int) {
        self.minnaNihongoDetailLabel.text = nil
        self.minnaNihongoOriginalLabel.text = nil
        let originalNumberString = "\(rowIndex + 1)"
        self.minnaNihongoOriginalLabel.text = originalNumberString
        let hiraganaString = minnaLesson.nekoJapanese
        let kanjiString = minnaLesson.nekoKanji + " - " + minnaLesson.nekoKanjiHanViet
        let englishString = minnaLesson.nekoEnglish
        let vietnameseString = minnaLesson.nekoVietNamese
        let mainString = hiraganaString + "\n" + kanjiString + "\n" + englishString + "\n" + vietnameseString
        HelperFunction.attributeTextOnLabel(mainString: mainString, childString: [hiraganaString, kanjiString, englishString, vietnameseString], color: [Constant.color19B, Constant.color19R, Constant.color16R, Constant.color19R], font: [Constant.font20B], label: self.minnaNihongoDetailLabel)
    }
}
