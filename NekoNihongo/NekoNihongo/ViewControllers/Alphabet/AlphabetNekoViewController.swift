//
//  AlphabetNekoViewController.swift
//  NekoNihongo
//
//  Created by Bao on 9/19/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

import UIKit
import AVFoundation

class AlphabetNekoViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var alphabetSelectionCollectionView: UICollectionView!
    
    @IBOutlet weak var speakerButton: UIBarButtonItem!
    
    // MARK: Variables
    
    struct StoryBoard {
        
        static let alphabetSelectionCellIdentifier = "AlphabetSelectionCellIdentifier"
        
        static let alphabetCollectionReusableCellIdentifier = "AlphabetCollectionReusableCellIdentifier"
        
        static let leftAndRightPaddings: CGFloat = 10.0
        
        static let numberOfItemsPerRow: CGFloat = 5.0
        
    }
    
    var titleAlphabet = ""
    
    var alphabetArray = [[NekoAlphabetModel]]()
    
    let alphabetHeaderArray = [ "Basic letters", "Dakuon", "Yōon" ]
    
//    deinit {
//        print("deinit")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titleAlphabet
        
        self.initView()
        
        if self.titleAlphabet == "Hiragana" {
            
            self.initDataHiragana()
            
        } else {
            
            self.initDataKatakana()
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    
    // MARK: Functions
    
    func initDataHiragana() {
        
        let higaranaCharacter = [
            NekoAlphabetModel(nekoJapaneseCharacter: "あ", nekoLatinCharacter: "a"),
            NekoAlphabetModel(nekoJapaneseCharacter: "い", nekoLatinCharacter: "i"),
            NekoAlphabetModel(nekoJapaneseCharacter: "う", nekoLatinCharacter: "u"),
            NekoAlphabetModel(nekoJapaneseCharacter: "え", nekoLatinCharacter: "e"),
            NekoAlphabetModel(nekoJapaneseCharacter: "お", nekoLatinCharacter: "o"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "か", nekoLatinCharacter: "ka"),
            NekoAlphabetModel(nekoJapaneseCharacter: "き", nekoLatinCharacter: "ki"),
            NekoAlphabetModel(nekoJapaneseCharacter: "く", nekoLatinCharacter: "ku"),
            NekoAlphabetModel(nekoJapaneseCharacter: "け", nekoLatinCharacter: "ke"),
            NekoAlphabetModel(nekoJapaneseCharacter: "こ", nekoLatinCharacter: "ko"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "さ", nekoLatinCharacter: "sa"),
            NekoAlphabetModel(nekoJapaneseCharacter: "し", nekoLatinCharacter: "shi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "す", nekoLatinCharacter: "su"),
            NekoAlphabetModel(nekoJapaneseCharacter: "せ", nekoLatinCharacter: "se"),
            NekoAlphabetModel(nekoJapaneseCharacter: "そ", nekoLatinCharacter: "so"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "た", nekoLatinCharacter: "ta"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ち", nekoLatinCharacter: "chi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "つ", nekoLatinCharacter: "tsu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "て", nekoLatinCharacter: "te"),
            NekoAlphabetModel(nekoJapaneseCharacter: "と", nekoLatinCharacter: "to"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "な", nekoLatinCharacter: "na"),
            NekoAlphabetModel(nekoJapaneseCharacter: "に", nekoLatinCharacter: "ni"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぬ", nekoLatinCharacter: "nu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ね", nekoLatinCharacter: "ne"),
            NekoAlphabetModel(nekoJapaneseCharacter: "の", nekoLatinCharacter: "no"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "は", nekoLatinCharacter: "ha"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ひ", nekoLatinCharacter: "hi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ふ", nekoLatinCharacter: "fu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "へ", nekoLatinCharacter: "he"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ほ", nekoLatinCharacter: "ho"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ま", nekoLatinCharacter: "ma"),
            NekoAlphabetModel(nekoJapaneseCharacter: "み", nekoLatinCharacter: "mi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "む", nekoLatinCharacter: "mu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "め", nekoLatinCharacter: "me"),
            NekoAlphabetModel(nekoJapaneseCharacter: "も", nekoLatinCharacter: "mo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "や", nekoLatinCharacter: "ya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ゆ", nekoLatinCharacter: "yu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "よ", nekoLatinCharacter: "yo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ら", nekoLatinCharacter: "ra"),
            NekoAlphabetModel(nekoJapaneseCharacter: "り", nekoLatinCharacter: "ri"),
            NekoAlphabetModel(nekoJapaneseCharacter: "る", nekoLatinCharacter: "ru"),
            NekoAlphabetModel(nekoJapaneseCharacter: "れ", nekoLatinCharacter: "re"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ろ", nekoLatinCharacter: "ro"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "わ", nekoLatinCharacter: "wa"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "を", nekoLatinCharacter: "wo"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ん", nekoLatinCharacter: "n") ]
        
        let combinationHiragana01 = [
            NekoAlphabetModel(nekoJapaneseCharacter: "が", nekoLatinCharacter: "ga"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぎ", nekoLatinCharacter: "gi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぐ", nekoLatinCharacter: "gu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "げ", nekoLatinCharacter: "ge"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ご", nekoLatinCharacter: "go"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ざ", nekoLatinCharacter: "za"),
            NekoAlphabetModel(nekoJapaneseCharacter: "じ", nekoLatinCharacter: "ji"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ず", nekoLatinCharacter: "zu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぜ", nekoLatinCharacter: "ze"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぞ", nekoLatinCharacter: "zo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "だ", nekoLatinCharacter: "da"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぢ", nekoLatinCharacter: "ji"),
            NekoAlphabetModel(nekoJapaneseCharacter: "づ", nekoLatinCharacter: "zu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "で", nekoLatinCharacter: "de"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ど", nekoLatinCharacter: "do"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ば", nekoLatinCharacter: "ba"),
            NekoAlphabetModel(nekoJapaneseCharacter: "び", nekoLatinCharacter: "bi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぶ", nekoLatinCharacter: "bu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "べ", nekoLatinCharacter: "be"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぼ", nekoLatinCharacter: "bo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ぱ", nekoLatinCharacter: "pa"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぴ", nekoLatinCharacter: "pi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぷ", nekoLatinCharacter: "pu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぺ", nekoLatinCharacter: "pe"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぽ", nekoLatinCharacter: "po") ]
        
        let combinationHiragana02 = [
            NekoAlphabetModel(nekoJapaneseCharacter: "きゃ", nekoLatinCharacter: "kya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "きゅ", nekoLatinCharacter: "kyu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "きょ", nekoLatinCharacter: "kyo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ぎゃ", nekoLatinCharacter: "gya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぎゅ", nekoLatinCharacter: "gyu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぎょ", nekoLatinCharacter: "gyo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "しゃ", nekoLatinCharacter: "sha"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "しゅ", nekoLatinCharacter: "shu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "しょ", nekoLatinCharacter: "sho"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "じゃ", nekoLatinCharacter: "ja"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "じゅ", nekoLatinCharacter: "ju"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "じょ", nekoLatinCharacter: "jo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ちゃ", nekoLatinCharacter: "cha"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ちゅ", nekoLatinCharacter: "chu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ちょ", nekoLatinCharacter: "cho"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ぢゃ", nekoLatinCharacter: "ja"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぢゅ", nekoLatinCharacter: "ju"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぢょ", nekoLatinCharacter: "jo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "にゃ", nekoLatinCharacter: "nya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "にゅ", nekoLatinCharacter: "nyu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "にょ", nekoLatinCharacter: "nyo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ひゃ", nekoLatinCharacter: "hya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ひゅ", nekoLatinCharacter: "hyu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ひょ", nekoLatinCharacter: "hyo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "びゃ", nekoLatinCharacter: "bya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "びゅ", nekoLatinCharacter: "byu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "びょ", nekoLatinCharacter: "byo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ぴゃ", nekoLatinCharacter: "pya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぴゅ", nekoLatinCharacter: "pyu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ぴょ", nekoLatinCharacter: "pyo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "みゃ", nekoLatinCharacter: "mya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "みゅ", nekoLatinCharacter: "myu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "みょ", nekoLatinCharacter: "myo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "りゃ", nekoLatinCharacter: "rya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "りゅ", nekoLatinCharacter: "ryu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "りょ", nekoLatinCharacter: "ryo") ]
        
        self.alphabetArray.append(higaranaCharacter)
        
        self.alphabetArray.append(combinationHiragana01)
        
        self.alphabetArray.append(combinationHiragana02)
        
    }
    
    func initDataKatakana() {
        
        let katakanaCharacter = [
            NekoAlphabetModel(nekoJapaneseCharacter: "ア", nekoLatinCharacter: "a"),
            NekoAlphabetModel(nekoJapaneseCharacter: "イ", nekoLatinCharacter: "i"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ウ", nekoLatinCharacter: "u"),
            NekoAlphabetModel(nekoJapaneseCharacter: "エ", nekoLatinCharacter: "e"),
            NekoAlphabetModel(nekoJapaneseCharacter: "オ", nekoLatinCharacter: "o"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "カ", nekoLatinCharacter: "ka"),
            NekoAlphabetModel(nekoJapaneseCharacter: "キ", nekoLatinCharacter: "ki"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ク", nekoLatinCharacter: "ku"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ケ", nekoLatinCharacter: "ke"),
            NekoAlphabetModel(nekoJapaneseCharacter: "コ", nekoLatinCharacter: "ko"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "サ", nekoLatinCharacter: "sa"),
            NekoAlphabetModel(nekoJapaneseCharacter: "シ", nekoLatinCharacter: "shi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ス", nekoLatinCharacter: "su"),
            NekoAlphabetModel(nekoJapaneseCharacter: "セ", nekoLatinCharacter: "se"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ソ", nekoLatinCharacter: "so"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "タ", nekoLatinCharacter: "ta"),
            NekoAlphabetModel(nekoJapaneseCharacter: "チ", nekoLatinCharacter: "chi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ツ", nekoLatinCharacter: "tsu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "テ", nekoLatinCharacter: "te"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ト", nekoLatinCharacter: "to"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ナ", nekoLatinCharacter: "na"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ニ", nekoLatinCharacter: "ni"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ヌ", nekoLatinCharacter: "nu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ネ", nekoLatinCharacter: "ne"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ノ", nekoLatinCharacter: "no"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ハ", nekoLatinCharacter: "ha"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ヒ", nekoLatinCharacter: "hi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "フ", nekoLatinCharacter: "fu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ヘ", nekoLatinCharacter: "he"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ホ", nekoLatinCharacter: "ho"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "マ", nekoLatinCharacter: "ma"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ミ", nekoLatinCharacter: "mi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ム", nekoLatinCharacter: "mu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "メ", nekoLatinCharacter: "me"),
            NekoAlphabetModel(nekoJapaneseCharacter: "モ", nekoLatinCharacter: "mo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ヤ", nekoLatinCharacter: "ya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ユ", nekoLatinCharacter: "yu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ヨ", nekoLatinCharacter: "yo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ラ", nekoLatinCharacter: "ra"),
            NekoAlphabetModel(nekoJapaneseCharacter: "リ", nekoLatinCharacter: "ri"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ル", nekoLatinCharacter: "ru"),
            NekoAlphabetModel(nekoJapaneseCharacter: "レ", nekoLatinCharacter: "re"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ロ", nekoLatinCharacter: "ro"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ワ", nekoLatinCharacter: "wa"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ヲ", nekoLatinCharacter: "wo"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ン", nekoLatinCharacter: "n") ]
        
        let katakanaCombination01 = [
            NekoAlphabetModel(nekoJapaneseCharacter: "ガ", nekoLatinCharacter: "ga"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ギ", nekoLatinCharacter: "gi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "グ", nekoLatinCharacter: "gu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ゲ", nekoLatinCharacter: "ge"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ゴ", nekoLatinCharacter: "go"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ザ", nekoLatinCharacter: "za"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ジ", nekoLatinCharacter: "ji"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ズ", nekoLatinCharacter: "zu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ゼ", nekoLatinCharacter: "ze"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ゾ", nekoLatinCharacter: "zo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ダ", nekoLatinCharacter: "da"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ヂ", nekoLatinCharacter: "ji"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ヅ", nekoLatinCharacter: "zu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "デ", nekoLatinCharacter: "de"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ド", nekoLatinCharacter: "do"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "バ", nekoLatinCharacter: "ba"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ビ", nekoLatinCharacter: "bi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ブ", nekoLatinCharacter: "bu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ベ", nekoLatinCharacter: "be"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ボ", nekoLatinCharacter: "bo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "パ", nekoLatinCharacter: "pa"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ピ", nekoLatinCharacter: "pi"),
            NekoAlphabetModel(nekoJapaneseCharacter: "プ", nekoLatinCharacter: "pu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ペ", nekoLatinCharacter: "pe"),
            NekoAlphabetModel(nekoJapaneseCharacter: "ポ", nekoLatinCharacter: "po") ]
        
        let katakanaCombination02 = [
            NekoAlphabetModel(nekoJapaneseCharacter: "キャ", nekoLatinCharacter: "kya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "キュ", nekoLatinCharacter: "kyu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "キョ", nekoLatinCharacter: "kyo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ギャ", nekoLatinCharacter: "gya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ギュ", nekoLatinCharacter: "gyu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ギョ", nekoLatinCharacter: "gyo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "シャ", nekoLatinCharacter: "sha"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "シュ", nekoLatinCharacter: "shu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ショ", nekoLatinCharacter: "sho"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ジャ", nekoLatinCharacter: "ja"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ジュ", nekoLatinCharacter: "ju"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ジョ", nekoLatinCharacter: "jo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "チャ", nekoLatinCharacter: "cha"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "チュ", nekoLatinCharacter: "chu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "チョ", nekoLatinCharacter: "cho"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ヂャ", nekoLatinCharacter: "ja"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ヂュ", nekoLatinCharacter: "ju"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ヂョ", nekoLatinCharacter: "jo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ニャ", nekoLatinCharacter: "nya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ニュ", nekoLatinCharacter: "nyu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ニョ", nekoLatinCharacter: "nyo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ヒャ", nekoLatinCharacter: "hya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ヒュ", nekoLatinCharacter: "hyu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ヒョ", nekoLatinCharacter: "hyo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ビャ", nekoLatinCharacter: "bya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ビュ", nekoLatinCharacter: "byu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ビョ", nekoLatinCharacter: "byo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ピャ", nekoLatinCharacter: "pya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ピュ", nekoLatinCharacter: "pyu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ピョ", nekoLatinCharacter: "pyo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "ミャ", nekoLatinCharacter: "mya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ミュ", nekoLatinCharacter: "myu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "ミョ", nekoLatinCharacter: "myo"),
            
            NekoAlphabetModel(nekoJapaneseCharacter: "リャ", nekoLatinCharacter: "rya"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "リュ", nekoLatinCharacter: "ryu"),
            NekoAlphabetModel(nekoJapaneseCharacter: "", nekoLatinCharacter: ""),
            NekoAlphabetModel(nekoJapaneseCharacter: "リョ", nekoLatinCharacter: "ryo") ]
        
        self.alphabetArray.append(katakanaCharacter)
        
        self.alphabetArray.append(katakanaCombination01)
        
        self.alphabetArray.append(katakanaCombination02)
        
    }
    
    func initView() {
        
        let bounds = UIScreen.main.bounds.width
        
        let width = (bounds - ((StoryBoard.numberOfItemsPerRow + 1) * StoryBoard.leftAndRightPaddings)) / StoryBoard.numberOfItemsPerRow
        
        let height = width
        
        (self.alphabetSelectionCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: width, height: height)
        
    }
    
}

extension AlphabetNekoViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.alphabetArray[section].count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let alphabetCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoard.alphabetSelectionCellIdentifier, for: indexPath) as! AlphabetSelectionCollectionViewCell
        
        let alphabetItem = self.alphabetArray[indexPath.section][indexPath.item]
        
        alphabetCell.alphabetLabel.text = ""
        alphabetCell.alphabetLabel.text = alphabetItem.nekoJapaneseCharacter
        
        alphabetCell.delegate = self
        
        return alphabetCell
        
    }
    
}

extension AlphabetNekoViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StoryBoard.alphabetCollectionReusableCellIdentifier, for: indexPath) as! AlphabetCollectionReusableView
        
        let category = alphabetHeaderArray[indexPath.section]
        
        headerView.alphabetHeaderCollectionView.text = category
        return headerView
        
    }
    
}

extension AlphabetNekoViewController: AlphabetSelectionDelegate {
    
    func pushToAlphabetDetailView(cell: AlphabetSelectionCollectionViewCell) {
        
        let AlphabetDetailViewController = AppDelegate.mainStoryBoard.instantiateViewController(withIdentifier: "AlphabetDetailViewController") as! AlphabetDetailViewController
        
        guard let indexPath = self.alphabetSelectionCollectionView.indexPath(for: cell) else {
            return
        }
        
        let alphabetItem = self.alphabetArray[indexPath.section][indexPath.item]
        
        if alphabetItem.nekoJapaneseCharacter != "" && alphabetItem.nekoLatinCharacter != "" {
            
            AlphabetDetailViewController.alphabetItemDetail = alphabetItem
            AlphabetDetailViewController.titleAlphabet = self.titleAlphabet
            
            let start = (indexPath.row / 5) * 5
            
            for alphabetIndex in start...(start + 4) {
                
                let alphabetItem = self.alphabetArray[indexPath.section][alphabetIndex]
                
                if alphabetItem.nekoJapaneseCharacter != "" && alphabetItem.nekoLatinCharacter != "" {
                    
                     AlphabetDetailViewController.alphabetFlipArray.append(alphabetItem)
                    
                }
                
            }
            
            self.navigationController?.pushViewController(AlphabetDetailViewController, animated: true)
            
        }
        
    }
    
}
