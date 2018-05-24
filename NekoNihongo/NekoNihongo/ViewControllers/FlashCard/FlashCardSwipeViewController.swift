//
//  FlashCardSwipeViewController.swift
//  NekoNihongo
//
//  Created by Bao on 9/12/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit
import Cartography
import Device
import AVFoundation

class FlashCardSwipeViewController: UIViewController, AVSpeechSynthesizerDelegate {
    
    // MARK: IBOutlets
    var flashCardView: ZLSwipeableView!
    @IBOutlet weak var cardContainerView: UIView!
    @IBOutlet weak var originalOfNekoCardLabel: UILabel!
    @IBOutlet weak var speakerButton: UIButton!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var controlWidthConstraint: NSLayoutConstraint!
    
    // MARK: IBActions
    @IBAction func reloadCardButton(_ sender: Any) {
        self.nekoCardIndex = 0
        self.flashCardView.discardViews()
        self.flashCardView.loadViews()
        self.flashCardView.history.removeAll()
        self.initOriginalNekoCard()
        self.initSpeaker()
        self.setImageLoveButton(isLoved: self.isLovedNekoFlashCard(cardIndex: self.flashCardView.history.count))
    }
    
    @IBAction func previousCardButton(_ sender: Any) {
        self.rewindFlashCard()
    }
    
    @IBAction func nextCardButton(_ sender: Any) {
        self.swipeNekoCardProgrammatically()
    }
    
    @IBAction func speakerButton(_ sender: Any) {
        self.readSound.speak(utterance)
        self.speakerButton.isUserInteractionEnabled = false
    }
    
    @IBAction func loveButton(_ sender: Any) {
        let nekoHistoryItem = self.flashCardView.history.count
        if self.isLovedNekoFlashCard(cardIndex: nekoHistoryItem) {
            self.removeLoveNekoFLashCard(cardIndex: nekoHistoryItem)
            self.setImageLoveButton(isLoved: false)
        } else {
            self.saveLoveNekoFlashCard(cardIndex: nekoHistoryItem)
            self.setImageLoveButton(isLoved: true)
        }
    }
    
    // MARK: Properties
    var nekoCardArray = [NekoModel]()
    var nekoCardIndex = 0
    var numberFlashcardLesson = 0
    var nekoCardItem = 0
    var stringSound = ""
    var utterance:AVSpeechUtterance!
    var readSound = AVSpeechSynthesizer()
    
    // MARK: Methods
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.flashCardView.nextView = {
            return self.nextCardView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.detectDeviceScreenSize()
    }
    
    deinit {
        print("deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lesson \(self.numberFlashcardLesson)"
        self.initDataLesson { error in
            if let error = error {
                print(error)
            } else {
                self.initOriginalNekoCard()
                self.initView()
                self.initSpeaker()
                self.setImageLoveButton(isLoved: self.isLovedNekoFlashCard(cardIndex: 0))
                //self.utterance.rate = 0.25
                self.readSound.delegate = self
            }
        }
    }
    
    func isLovedNekoFlashCard(cardIndex: Int) -> Bool {
        return UserDefaults.standard.object(forKey: "FlashCard-\(self.numberFlashcardLesson)-\(cardIndex)") != nil
    }
    
    func saveLoveNekoFlashCard(cardIndex: Int) {
        let userDefaults = UserDefaults.standard
        userDefaults.set("", forKey: "FlashCard-\(self.numberFlashcardLesson)-\(cardIndex)")
        userDefaults.synchronize()
    }
    
    func removeLoveNekoFLashCard(cardIndex: Int) {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "FlashCard-\(self.numberFlashcardLesson)-\(cardIndex)")
        userDefaults.synchronize()
    }
    
    func setImageLoveButton(isLoved: Bool) {
        if isLoved {
            self.loveButton.setImage(UIImage(named: "loved"), for: .normal)
        } else {
            self.loveButton.setImage(UIImage(named: "love"), for: .normal)
        }
    }
    
    func detectDeviceScreenSize() {
        /*** Display the device screen size ***/
        switch Device.size() {
        case .screen3_5Inch: print("It's a 3.5 inch screen")
        case .screen4Inch:      self.updateLayoutConstraintsControlView()
        case .screen4_7Inch:  print("It's a 4.7 inch screen")
        case .screen5_5Inch:  print("It's a 5.5 inch screen")
        case .screen7_9Inch:  print("It's a 7.9 inch screen")
        case .screen9_7Inch:  print("It's a 9.7 inch screen")
        case .screen12_9Inch: print("It's a 12.9 inch screen")
        default: print("Unknown size")
        }
    }
    
    func updateLayoutConstraintsControlView() {
        self.controlWidthConstraint = self.controlWidthConstraint.setMultiplier(multiplier: 4.0/7.0)
    }
    
    func swipeNekoCardProgrammatically() {
        let randomNum01 = arc4random_uniform(3)
        switch randomNum01 {
        case 0:
            self.flashCardView.swipeTopView(inDirection: .Left)
            break
        case 1:
            self.flashCardView.swipeTopView(inDirection: .Right)
            break
        case 2:
            self.flashCardView.swipeTopView(inDirection: .Up)
            break
        default:
            break
        }
    }
    
    func rewindFlashCard() {
        let flashHistoryItem = self.flashCardView.history.count
        if flashHistoryItem > 0 {
            self.nekoCardIndex = self.nekoCardIndex - 1
            self.originalOfNekoCardLabel.text = "\(flashHistoryItem)/\(self.nekoCardItem)"
            self.flashCardView.rewind()
            self.setUpCurrentSpeaker(index: flashHistoryItem - 1)
            self.setImageLoveButton(isLoved: self.isLovedNekoFlashCard(cardIndex: flashHistoryItem - 1))
        }
    }
    
    func initOriginalNekoCard() {
        self.originalOfNekoCardLabel.text = "1/\(self.nekoCardArray.count)"
    }
    
    func initSpeaker() {
        self.stringSound = self.nekoCardArray[0].nekoSound
        self.utterance = AVSpeechUtterance(string: "\(stringSound)")
        self.utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
    }
    
    func setUpCurrentSpeaker(index: Int) {
        self.stringSound = self.nekoCardArray[index].nekoSound
        self.utterance = AVSpeechUtterance(string: "\(self.stringSound)")
        self.utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
    }
    
    func initView() {
        self.view.backgroundColor = UIColor.white
        self.view.clipsToBounds = true
        self.flashCardView = ZLSwipeableView()
        self.view.addSubview(self.flashCardView)
        self.flashCardView.numberOfHistoryItem = UInt.max
        self.flashCardView.allowedDirection = Direction.All
//        self.flashCardView.didStart = {view, location in
//            //print("Did start swiping view at location: \(location)")
//        }
//        self.flashCardView.swiping = {view, location, translation in
//            //print("Swiping at view location: \(location) translation: \(translation)")
//        }
//        self.flashCardView.didEnd = {view, location in
//            //print("Did end swiping view at location: \(location)")
//        }
        self.flashCardView.didSwipe = { [weak self] view, direction, vector in
            guard let strongSelf = self else { return }
            //print("Did swipe view in direction: \(direction), vector: \(vector)")
            let historyCardItem = strongSelf.flashCardView.history.count
            if historyCardItem == strongSelf.nekoCardItem {
                strongSelf.flashCardView.history.removeAll()
            }
            let flashHistoryItem = strongSelf.flashCardView.history.count
            strongSelf.setUpCurrentSpeaker(index: flashHistoryItem)
            strongSelf.originalOfNekoCardLabel.text = "\(flashHistoryItem + 1)/\(strongSelf.nekoCardItem)"
            strongSelf.setImageLoveButton(isLoved: strongSelf.isLovedNekoFlashCard(cardIndex: flashHistoryItem))
        }
//        self.flashCardView.didCancel = {view in
//            //print("Did cancel swiping view")
//        }
//        self.flashCardView.didTap = {view, location in
//            //print("Did tap at location \(location)")
//        }
//        self.flashCardView.didDisappear = { view in
//            //print("Did disappear swiping view")
//        }
        constrain(self.flashCardView, cardContainerView) { view1, view2 in
            view1.left == view2.left
            view1.right == view2.right
            view1.top == view2.top
            view1.bottom == view2.bottom
        }
    }
    
    func initDataLesson(completion:(Error?) -> Void) {
        MinnaLessonDataProvider.shared.getMinnaLessonByOrderNumber(orderNumber: self.numberFlashcardLesson) { [weak self] minnaLessons, error in
            if let error = error {
                completion(error)
            }
            if let minnaLessons = minnaLessons {
                self?.nekoCardArray = minnaLessons.filter({ $0.nekoSound != "" })
                self?.nekoCardItem = (self?.nekoCardArray.count)!
                completion(nil)
            }
        }
    }
    
    func nextCardView() -> UIView? {
        if self.nekoCardIndex >= self.nekoCardArray.count {
            self.nekoCardIndex = 0
        }
        let cardView = NekoCardView(frame: flashCardView.bounds)
        let contentView = Bundle.main.loadNibNamed("NekoCardContentView", owner: self, options: nil)?.first! as! UIView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = cardView.backgroundColor
        let nekoCardImageView = contentView.viewWithTag(100) as! UIImageView
        nekoCardImageView.image = UIImage(named: "\(self.nekoCardArray[self.nekoCardIndex].nekoLatin)")
        self.nekoCardIndex += 1
        cardView.addSubview(contentView)
        constrain(contentView, cardView) { view1, view2 in
            view1.left == view2.left
            view1.top == view2.top
            view1.width == cardView.bounds.width
            view1.height == cardView.bounds.height
        }
        return cardView
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.speakerButton.isUserInteractionEnabled = true
    }
}
