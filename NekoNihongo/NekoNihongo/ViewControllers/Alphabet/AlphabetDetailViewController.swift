//
//  AlphabetDetailViewController.swift
//  NekoNihongo
//
//  Created by Bao on 9/21/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit
import AVFoundation

class AlphabetDetailViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var alphabetLabel: UILabel!
    @IBOutlet weak var alphabetImageView: UIImageView!
    @IBOutlet weak var alphabetOptionCollectionView: UICollectionView!
    @IBOutlet weak var alphabetOptionContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var speakerButton: UIButton!
    // MARK: Properties
    struct StoryBoard {
        static let alphabetOptionCellIdentifier = "AlphabetOptionCellIdentifier"
        static let leftAndRightPaddings: CGFloat = 10.0
        static let numberOfItemsPerRow: CGFloat = 5.0
    }
    var isJapaneseCharacter = true
    var alphabetFlipArray = [NekoAlphabetModel]()
    var alphabetItemDetail: NekoAlphabetModel!
    var titleAlphabet = ""
    var utterance:AVSpeechUtterance!
    var readSound = AVSpeechSynthesizer()
    
    deinit {
        print("deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleAlphabet
        self.alphabetLabel.text = self.alphabetItemDetail.nekoJapaneseCharacter
        let tapGesture01 = UITapGestureRecognizer(target: self, action: #selector(self.flipNekoCardAlphabet))
        let tapGesture02 = UITapGestureRecognizer(target: self, action: #selector(self.flipNekoCardAlphabet))
        self.alphabetLabel.addGestureRecognizer(tapGesture01)
        self.alphabetImageView.addGestureRecognizer(tapGesture02)
        self.initView()
        self.initSpeaker()
        self.readSound.delegate = self
    }
    
    // MARK: IBActions
    @IBAction func speakerButton(_ sender: Any) {
        self.readSound.speak(utterance)
        self.speakerButton.isUserInteractionEnabled = false
    }
    
    @IBAction func standardSpellingButton(_ sender: Any) {
        if self.alphabetItemDetail.nekoJapaneseCharacter.count == 2 {
            let AlphabetStrokeOrderDoubleCharacterViewController = Constant.mainStoryBoard.instantiateViewController(withIdentifier: "AlphabetStrokeOrderDoubleCharacterViewController") as! AlphabetStrokeOrderDoubleCharacterViewController
            let arrayOfString = self.alphabetItemDetail.nekoJapaneseCharacter.map { (Character) -> Character in
                return Character
            }
            AlphabetStrokeOrderDoubleCharacterViewController.svgImage01 = String(arrayOfString[0])
            AlphabetStrokeOrderDoubleCharacterViewController.svgImage02 = String(arrayOfString[1])
            AlphabetStrokeOrderDoubleCharacterViewController.titleString = self.title
            self.present(AlphabetStrokeOrderDoubleCharacterViewController, animated: true, completion: nil)
            
        } else {
            let AlphabetStrokeOrderViewController = Constant.mainStoryBoard.instantiateViewController(withIdentifier: "AlphabetStrokeOrderViewController") as! AlphabetStrokeOrderViewController
            AlphabetStrokeOrderViewController.svgImage = self.alphabetItemDetail.nekoJapaneseCharacter
            self.present(AlphabetStrokeOrderViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: Methods
    func initView() {
        let bounds = UIScreen.main.bounds.width
        let width = (bounds - ((StoryBoard.numberOfItemsPerRow + 1) * StoryBoard.leftAndRightPaddings)) / StoryBoard.numberOfItemsPerRow
        let height = width
        (self.alphabetOptionCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: width, height: height)
        self.alphabetOptionContainerHeightConstraint.constant = self.alphabetOptionContainerHeightConstraint.constant - height + 13
        if self.alphabetFlipArray.count < 5 {
            let edgeInsets = (bounds - (StoryBoard.numberOfItemsPerRow * width))
            self.alphabetOptionCollectionView.contentInset.left = edgeInsets
            self.alphabetOptionCollectionView.contentInset.right = edgeInsets
        }
    }
    
    func initSpeaker() {
        self.utterance = AVSpeechUtterance(string: "\(self.alphabetItemDetail.nekoJapaneseCharacter)")
        self.utterance.rate = 0.15
        self.utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
    }
    
    @objc func flipNekoCardAlphabet() {
        if self.isJapaneseCharacter {
            self.isJapaneseCharacter = false
            UIView.transition(with: self.containerView, duration: 0.5, options: .transitionFlipFromRight, animations: {
                self.alphabetLabel.text = self.alphabetItemDetail.nekoLatinCharacter
            }, completion: nil)
        } else {
            self.isJapaneseCharacter = true
            UIView.transition(with: self.containerView, duration: 0.5, options: .transitionFlipFromRight, animations: {
                self.alphabetLabel.text = self.alphabetItemDetail.nekoJapaneseCharacter
            }, completion: nil)
        }
    }
}

extension AlphabetDetailViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.alphabetFlipArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let alphabetOptionCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.alphabetOptionCellIdentifier, for: indexPath) as! AlphabetOptionCollectionViewCell
        let alphabetOptionItem = self.alphabetFlipArray[indexPath.item]
        alphabetOptionCell.alphabetOptionLabel.textColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        alphabetOptionCell.alphabetOptionLabel.text = nil
        alphabetOptionCell.alphabetOptionLabel.text = alphabetOptionItem.nekoJapaneseCharacter
        alphabetOptionCell.alphabetOptionImageView.image = nil
        if (alphabetOptionItem.nekoJapaneseCharacter == self.alphabetItemDetail.nekoJapaneseCharacter) {
            alphabetOptionCell.alphabetOptionLabel.textColor = .white
            alphabetOptionCell.alphabetOptionImageView.image = UIImage(named: "darkBackground")
        } else {
            alphabetOptionCell.alphabetOptionImageView.image = UIImage(named: "alphabetBackground")
        }
        alphabetOptionCell.delegate = self
        return alphabetOptionCell
    }
}

//extension AlphabetDetailViewController: UICollectionViewDelegate {
//
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//
//
//
//    }
//
//}

extension AlphabetDetailViewController: AlphabetOptionDelegate {
    func selectAlphabetOption(cell: AlphabetOptionCollectionViewCell) {
        guard let indexPath = self.alphabetOptionCollectionView.indexPath(for: cell) else {
            return
        }
        self.alphabetOptionCollectionView.reloadData()
        let alphabetOptionSelectedItem = self.alphabetFlipArray[indexPath.item]
        self.alphabetItemDetail = alphabetOptionSelectedItem
        self.isJapaneseCharacter = true
        self.alphabetLabel.text = self.alphabetItemDetail.nekoJapaneseCharacter
        self.utterance = AVSpeechUtterance(string: self.alphabetItemDetail.nekoJapaneseCharacter)
        self.utterance.rate = 0.15
        self.utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
    }
}

extension AlphabetDetailViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.speakerButton.isUserInteractionEnabled = true
    }
}
