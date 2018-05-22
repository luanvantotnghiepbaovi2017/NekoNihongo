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
    
    // MARL: Variables
    
//    deinit {
//        print("deinit")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nekoHiraganaTapGesture = UITapGestureRecognizer(target: self, action: #selector(pushToHiraganaAlphabetView))
        let nekoKatakanaTapGesture = UITapGestureRecognizer(target: self, action: #selector(pushToKatakanaAlphabetView))
        
        self.hiraganaOptionImageView.addGestureRecognizer(nekoHiraganaTapGesture)
        self.katakanaOptionImageView.addGestureRecognizer(nekoKatakanaTapGesture)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Functions
    
    @objc func pushToHiraganaAlphabetView() {
        
        let AlphabetNekoViewController = AppDelegate.mainStoryBoard.instantiateViewController(withIdentifier: "AlphabetNekoViewController") as! AlphabetNekoViewController
        
        AlphabetNekoViewController.titleAlphabet = "Hiragana"
        
        self.navigationController?.pushViewController(AlphabetNekoViewController, animated: true)
        
    }
    
    @objc func pushToKatakanaAlphabetView() {
        
        let AlphabetNekoViewController = AppDelegate.mainStoryBoard.instantiateViewController(withIdentifier: "AlphabetNekoViewController") as! AlphabetNekoViewController
        
        AlphabetNekoViewController.titleAlphabet = "Katakana"
        
        self.navigationController?.pushViewController(AlphabetNekoViewController, animated: true)
        
    }
    
}
