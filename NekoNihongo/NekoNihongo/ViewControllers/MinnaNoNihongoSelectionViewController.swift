//
//  MinnaNoNihongoSelectionViewController.swift
//  NekoNihongo
//
//  Created by Bao on 9/12/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

class MinnaNoNihongoSelectionViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var minnaNoNihongoSelectionCollectionView: UICollectionView!
    
    // MARK: Properties
    private var numberOfMinnaLessons = 0
    private struct StoryBoard {
        static let minnaLessonCellIdentifier = "MinnaLessonCellIdentifier"
        static let leftAndRightPaddings: CGFloat = 10.0
        static let numberOfItemsPerRow: CGFloat = 4.0
    }
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        self.initMinnaLessonsData()
    }
    
    deinit {
        print("deinit")
    }
    
    func initView() {
        let bounds = UIScreen.main.bounds.width
        let width = (bounds - ((StoryBoard.numberOfItemsPerRow + 1) * StoryBoard.leftAndRightPaddings)) / StoryBoard.numberOfItemsPerRow
        let height = width
        (self.minnaNoNihongoSelectionCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: width, height: height)
    }
    func initMinnaLessonsData() {
        HelperFunction.getCountOfFileInFolderWithPrefix(fileNamePrefix: Constant.minnaLessonName) { [weak self] count, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let minnaLessonCount = count {
                self?.numberOfMinnaLessons = minnaLessonCount
                self?.minnaNoNihongoSelectionCollectionView.reloadData()
            }
        }
    }
}

// MARK: Extension - UICollectionViewDataSource
extension MinnaNoNihongoSelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfMinnaLessons
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let minnaNihongoCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.minnaLessonCellIdentifier, for: indexPath) as! MinnaNoNihongoSelectionCollectionViewCell
        minnaNihongoCell.configureCell(lessonOrderNumber: indexPath.row)
        minnaNihongoCell.delegate = self
        return minnaNihongoCell
    }
}

// MARK: Extension - MinnaNoNihongoSelectionCollectionViewCellDelegate
extension MinnaNoNihongoSelectionViewController: MinnaNoNihongoSelectionCollectionViewCellDelegate {
    func selectMinnaNihongoLesson(cell: MinnaNoNihongoSelectionCollectionViewCell) {
        let MinnaNoNihongoDetailViewController = Constant.mainStoryBoard.instantiateViewController(withIdentifier: "MinnaNoNihongoDetailViewController") as! MinnaNoNihongoDetailViewController
        guard let indexPath = self.minnaNoNihongoSelectionCollectionView.indexPath(for: cell) else {
            return
        }
        MinnaNoNihongoDetailViewController.numberOfMinnaNihongoLesson = indexPath.row + 1
        self.navigationController?.pushViewController(MinnaNoNihongoDetailViewController, animated: true)
    }
}
