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
    
    // MARK: Variables
    
    struct StoryBoard {
        
        static let flashCardCellIdentifier = "FlashCardCellIdentifier"
        
        static let leftAndRightPaddings: CGFloat = 10.0
        
        static let numberOfItemsPerRow: CGFloat = 4.0
        
    }
    
    var flashcardsArray = [Int]()
    
    deinit {
        print("deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
        
        self.initFlashcardsData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Functions
    
    func initView() {
        
        let bounds = UIScreen.main.bounds.width
        
        let width = (bounds - ((StoryBoard.numberOfItemsPerRow + 1) * StoryBoard.leftAndRightPaddings)) / StoryBoard.numberOfItemsPerRow
        
        let height = width
        
        (self.flashCardSelectionCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: width, height: height)
        
    }
    
    func initFlashcardsData() {
        
        for index in 1...AppDelegate.countOfMinnaLessons {
            
            self.flashcardsArray.append(index)
            
        }
        
    }
    
}

extension FlashCardSelectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.flashcardsArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let flashCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.flashCardCellIdentifier, for: indexPath) as! FlashCardSelectionCollectionViewCell
        
        let flashCardItem = self.flashcardsArray[indexPath.row]
        
        flashCardCell.nekoFlashCardSelectionLabel.text = ""
        flashCardCell.nekoFlashCardSelectionLabel.text = "\(flashCardItem)"
        
        flashCardCell.delegate = self
        
        return flashCardCell
        
    }
    
}

extension FlashCardSelectionViewController: FlashCardSelectionDelegate {
    
    func pushToFlashCardSwipeView(cell: FlashCardSelectionCollectionViewCell) {
        
        let FlashCardSwipeViewController = AppDelegate.mainStoryBoard.instantiateViewController(withIdentifier: "FlashCardSwipeViewController") as! FlashCardSwipeViewController
        
        guard let indexPath = self.flashCardSelectionCollectionView.indexPath(for: cell) else {
            return
        }
        
        let flashCardItem = self.flashcardsArray[indexPath.item]
        
        FlashCardSwipeViewController.numberFlashcardLesson = flashCardItem
        
        self.navigationController?.pushViewController(FlashCardSwipeViewController, animated: true)
        
    }
    
}
