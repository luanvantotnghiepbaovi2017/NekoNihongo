//
//  MinnaNoNihongoDetailViewController.swift
//  NekoNihongo
//
//  Created by Bao on 11/2/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

struct CellPadding {
    static let padding8: CGFloat = 8.0
    static let padding12: CGFloat = 12.0
}

class MinnaNoNihongoDetailViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var minnaNihongoLessonTableView: UITableView!
    
    // MARK: Properties
    struct StoryBoard {
        static let minnaNihongoDetailCellIdentifier = "MinnaNihongoDetailCellIdentifier"
    }
    
    var numberOfMinnaNihongoLesson = 0
    var minnaNihongoLessonArray = [NekoModel]()
    
    // MARK: Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Lesson \(self.numberOfMinnaNihongoLesson)"
        self.initMinnaNihongoLesson()
    }
    
    deinit {
        print("deinit")
    }
    
    func initMinnaNihongoLesson() {
        MinnaLessonDataProvider.shared.getMinnaLessonByOrderNumber(orderNumber: self.numberOfMinnaNihongoLesson) { [weak self] minnaLessons, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let minnaLessons = minnaLessons {
                let numberTitleWidth: CGFloat = 30
                let width = UIScreen.main.bounds.size.width - CellPadding.padding8 - numberTitleWidth - CellPadding.padding12 - CellPadding.padding8
                for minnaLesson in minnaLessons {
                    let heightOfLabel01: CGFloat = HelperFunction.height(for: minnaLesson.nekoJapanese, with: Constant.font20B, width: width)
                    let heightOfLabel02: CGFloat = HelperFunction.height(for: minnaLesson.nekoKanji + " - " + minnaLesson.nekoKanjiHanViet, with: Constant.font20B, width: width)
                    let heightOfLabel03: CGFloat = HelperFunction.height(for: minnaLesson.nekoEnglish, with: Constant.font20B, width: width)
                    let heightOfLabel04: CGFloat = HelperFunction.height(for: minnaLesson.nekoVietNamese, with: Constant.font20B, width: width)
                    minnaLesson.nekoTotalHeight = CellPadding.padding8 + heightOfLabel01 + CellPadding.padding12 + heightOfLabel02 + CellPadding.padding12 + heightOfLabel03 + CellPadding.padding12 + heightOfLabel04 + CellPadding.padding12
                }
                self?.minnaNihongoLessonArray = minnaLessons
                self?.minnaNihongoLessonTableView.reloadData()
            }
        }
    }
}

// MARK: Extension - UITableViewDataSource
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
        minnaNihongoDetailCell.configureCell(minnaLesson: minnaNihongoItem, rowIndex: indexPath.row)
        return minnaNihongoDetailCell
    }
}

// MARK: Extension - UITableViewDelegate
extension MinnaNoNihongoDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let minnaNihongoItem = self.minnaNihongoLessonArray[indexPath.row]
        return minnaNihongoItem.nekoTotalHeight
    }
}
