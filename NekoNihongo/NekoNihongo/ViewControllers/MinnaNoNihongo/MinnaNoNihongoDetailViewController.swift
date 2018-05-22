//
//  MinnaNoNihongoDetailViewController.swift
//  NekoNihongo
//
//  Created by Bao on 11/2/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

import UIKit

class MinnaNoNihongoDetailViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var minnaNihongoLessonTableView: UITableView!
    
    // MARK: Variables
    
    struct StoryBoard {
        
        static let minnaNihongoDetailCellIdentifier = "MinnaNihongoDetailCellIdentifier"
        
        static let rowHeight: CGFloat = 1000.0
        
        static let font20B = UIFont(name: "BalsamiqSansBold", size: 20) ?? UIFont.systemFont(ofSize: 20)
        
        static let font16R = UIFont(name: "VNF-ComicSans", size: 16) ?? UIFont.systemFont(ofSize: 16)
        
        static let color19B = UIColor(red: 69.0/255.0, green: 134.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        static let color19R = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        
        static let color16R = UIColor(red: 32.0/255.0, green: 147.0/255.0, blue: 188.0/255.0, alpha: 1.0)
        
    }
    
    var numberOfMinnaNihongoLesson = 0
    
    var minnaNihongoLessonArray = [NekoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Lesson \(self.numberOfMinnaNihongoLesson)"
        
        self.minnaNihongoLessonTableView.estimatedRowHeight = StoryBoard.rowHeight
        self.minnaNihongoLessonTableView.rowHeight = UITableViewAutomaticDimension
        
        self.initMinnaNihongoLesson()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Functions
    
    func initMinnaNihongoLesson() {
        
        switch self.numberOfMinnaNihongoLesson {
            
        case 1:
            
            self.minnaNihongoLessonArray =  AppDelegate.minnaNihongoLesson01Array
            break
            
        case 2:
            
            self.minnaNihongoLessonArray =  AppDelegate.minnaNihongoLesson02Array
            break
            
        default:
            
            self.minnaNihongoLessonArray =  AppDelegate.minnaNihongoLesson01Array
            break
            
        }
        
    }
    
}

extension MinnaNoNihongoDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.minnaNihongoLessonArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let minnaNihongoDetailCell = tableView.dequeueReusableCell(withIdentifier: StoryBoard.minnaNihongoDetailCellIdentifier, for: indexPath) as! MinnaNihongoDetailTableViewCell
        
        let minnaNihongoItem = self.minnaNihongoLessonArray[indexPath.row]
        
        minnaNihongoDetailCell.minnaNihongoDetailLabel.text = nil
        minnaNihongoDetailCell.minnaNihongoOriginalLabel.text = nil
        
        let originalNumberString = "\(indexPath.row + 1)"
        minnaNihongoDetailCell.minnaNihongoOriginalLabel.text = originalNumberString
        
        let hiraganaString = minnaNihongoItem.nekoJapanese
        
        let kanjiString = minnaNihongoItem.nekoKanji + " - " + minnaNihongoItem.nekoKanjiHanViet
        let englishString = minnaNihongoItem.nekoEnglish
        let vietnameseString = minnaNihongoItem.nekoVietNamese
        
        let mainString = hiraganaString + "\n" + kanjiString + "\n" + englishString + "\n" + vietnameseString
        
        HelperFunction.attributeTextOnLabel(mainString: mainString, childString: [hiraganaString, kanjiString, englishString, vietnameseString], color: [StoryBoard.color19B, StoryBoard.color19R, StoryBoard.color16R, StoryBoard.color19R], font: [StoryBoard.font20B], label: minnaNihongoDetailCell.minnaNihongoDetailLabel)
        
        return minnaNihongoDetailCell
        
    }
    
}
