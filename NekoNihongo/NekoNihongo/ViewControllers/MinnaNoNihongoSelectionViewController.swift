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
    
    // MARK: Variables
    
    struct StoryBoard {
        
        static let minnaLessonCellIdentifier = "MinnaLessonCellIdentifier"
        
        static let leftAndRightPaddings: CGFloat = 10.0
        
        static let numberOfItemsPerRow: CGFloat = 4.0
        
    }
    
    var minnaLessonsArray = [Int]()
    
    deinit {
        print("deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
        
        self.initMinnaLessonsData()
        
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
        
        (self.minnaNoNihongoSelectionCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: width, height: height)
    }
    
    func initMinnaLessonsData() {
        
        for index in 1...AppDelegate.countOfMinnaLessons {
            
            self.minnaLessonsArray.append(index)
            
        }
        
    }
    
}

extension MinnaNoNihongoSelectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.minnaLessonsArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let minnaNihongoCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.minnaLessonCellIdentifier, for: indexPath) as! MinnaNoNihongoSelectionCollectionViewCell
        
        let minnaLessonItem = self.minnaLessonsArray[indexPath.row]
        
        minnaNihongoCell.nekoMinnaNoNihongoSelectionLabel.text = ""
        minnaNihongoCell.nekoMinnaNoNihongoSelectionLabel.text = "\(minnaLessonItem)"
        
        minnaNihongoCell.delegate = self
        
        return minnaNihongoCell
        
    }
    
}

extension MinnaNoNihongoSelectionViewController: MinnaNoNihongoSelectionCollectionViewCellDelegate {
    
    func selectMinnaNihongoLesson(cell: MinnaNoNihongoSelectionCollectionViewCell) {
        
        let MinnaNoNihongoDetailViewController = AppDelegate.mainStoryBoard.instantiateViewController(withIdentifier: "MinnaNoNihongoDetailViewController") as! MinnaNoNihongoDetailViewController
        
        guard let indexPath = self.minnaNoNihongoSelectionCollectionView.indexPath(for: cell) else {
            return
        }
        
        let minnaNihongoItem = self.minnaLessonsArray[indexPath.item]
        
        MinnaNoNihongoDetailViewController.numberOfMinnaNihongoLesson = minnaNihongoItem
        
        self.navigationController?.pushViewController(MinnaNoNihongoDetailViewController, animated: true)
        
    }
    
}
