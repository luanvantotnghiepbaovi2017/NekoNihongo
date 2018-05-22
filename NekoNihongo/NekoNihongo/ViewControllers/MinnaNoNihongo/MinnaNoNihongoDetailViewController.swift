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
    // MARK: Properties
    struct StoryBoard {
        static let minnaNihongoDetailCellIdentifier = "MinnaNihongoDetailCellIdentifier"
        static let rowHeight: CGFloat = 1000.0
    }
    
    var numberOfMinnaNihongoLesson = 0
    var minnaNihongoLessonArray = [NekoModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Lesson \(self.numberOfMinnaNihongoLesson)"
        self.setUpMinnaLessonTableView()
        self.initMinnaNihongoLesson()
    }
    
    // MARK: Methods
    func setUpMinnaLessonTableView() {
        self.minnaNihongoLessonTableView.estimatedRowHeight = StoryBoard.rowHeight
        self.minnaNihongoLessonTableView.rowHeight = UITableViewAutomaticDimension
    }
    func initMinnaNihongoLesson() {
        MinnaLessonDataProvider.shared.getMinnaLessonByOrderNumber(orderNumber: self.numberOfMinnaNihongoLesson) { [weak self] minnaLessons, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let minnaLessons = minnaLessons {
                self?.minnaNihongoLessonArray = minnaLessons
                self?.minnaNihongoLessonTableView.reloadData()
            }
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
        minnaNihongoDetailCell.configureCell(minnaLesson: minnaNihongoItem, rowIndex: indexPath.row)
        return minnaNihongoDetailCell
    }
}
