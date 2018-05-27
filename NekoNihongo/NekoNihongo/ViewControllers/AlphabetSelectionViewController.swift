//
//  AlphabetSelectionViewController.swift
//  NekoNihongo
//
//  Created by Bao on 9/11/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

class AlphabetSelectionViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var hiraganaOptionImageView: UIImageView!
    @IBOutlet weak var katakanaOptionImageView: UIImageView!
    
    // MARK: Properties
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let nekoHiraganaTapGesture = UITapGestureRecognizer(target: self, action: #selector(pushToHiraganaAlphabetView))
        let nekoKatakanaTapGesture = UITapGestureRecognizer(target: self, action: #selector(pushToKatakanaAlphabetView))
        self.hiraganaOptionImageView.addGestureRecognizer(nekoHiraganaTapGesture)
        self.katakanaOptionImageView.addGestureRecognizer(nekoKatakanaTapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning - AlphabetSelectionViewController")
    }
    
    deinit {
        print("deinit")
    }
    
    @objc func pushToHiraganaAlphabetView() {
        let AlphabetNekoViewController = Constant.mainStoryBoard.instantiateViewController(withIdentifier: "AlphabetNekoViewController") as! AlphabetNekoViewController
        AlphabetNekoViewController.titleAlphabet = "Hiragana"
        self.navigationController?.pushViewController(AlphabetNekoViewController, animated: true)
    }
    
    @objc func pushToKatakanaAlphabetView() {
        let AlphabetNekoViewController = Constant.mainStoryBoard.instantiateViewController(withIdentifier: "AlphabetNekoViewController") as! AlphabetNekoViewController
        AlphabetNekoViewController.titleAlphabet = "Katakana"
        self.navigationController?.pushViewController(AlphabetNekoViewController, animated: true)
    }
}
