//
//  FlashCardSelectionViewController.swift
//  NekoNihongo
//
//  Created by Bao on 9/12/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

class FlashCardSelectionViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var flashCardSelectionCollectionView: UICollectionView!
    
    // MARK: Properties
    private var numberOfMinnaLessons = 0
    private struct StoryBoard {
        static let flashCardCellIdentifier = "FlashCardCellIdentifier"
        static let leftAndRightPaddings: CGFloat = 10.0
        static let numberOfItemsPerRow: CGFloat = 4.0
    }
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        self.initFlashcardsData()
    }
    
    deinit {
        print("deinit")
    }
    
    func initView() {
        let bounds = UIScreen.main.bounds.width
        let width = (bounds - ((StoryBoard.numberOfItemsPerRow + 1) * StoryBoard.leftAndRightPaddings)) / StoryBoard.numberOfItemsPerRow
        let height = width
        (self.flashCardSelectionCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: width, height: height)
    }
    
    func initFlashcardsData() {
        HelperFunction.getCountOfFileInFolderWithPrefix(fileNamePrefix: Constant.minnaLessonName) { [weak self] count, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let minnaLessonCount = count {
                self?.numberOfMinnaLessons = minnaLessonCount
                self?.flashCardSelectionCollectionView.reloadData()
            }
        }
    }
}


extension FlashCardSelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfMinnaLessons
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let flashCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.flashCardCellIdentifier, for: indexPath) as! FlashCardSelectionCollectionViewCell
        flashCardCell.configureCell(lessonOrderNumber: indexPath.row)
        flashCardCell.delegate = self
        return flashCardCell
    }
}

extension FlashCardSelectionViewController: FlashCardSelectionDelegate {
    func pushToFlashCardSwipeView(cell: FlashCardSelectionCollectionViewCell) {
        let FlashCardSwipeViewController = Constant.mainStoryBoard.instantiateViewController(withIdentifier: "FlashCardSwipeViewController") as! FlashCardSwipeViewController
        guard let indexPath = self.flashCardSelectionCollectionView.indexPath(for: cell) else {
            return
        }
        FlashCardSwipeViewController.numberFlashcardLesson = indexPath.row + 1
        self.navigationController?.pushViewController(FlashCardSwipeViewController, animated: true)
    }
}
