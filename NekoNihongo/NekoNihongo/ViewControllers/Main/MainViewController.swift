//
//  MainViewController.swift
//  NekoNihongo
//
//  Created by Bao on 9/11/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit
import ASExtendedCircularMenu

class MainViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var nekoTableView: UITableView!
    @IBOutlet weak var nekoMenuButton: ASCircularMenuButton!
    @IBOutlet weak var blurMenuUIView: UIView!
    
    // MARK: IBActions
    @IBAction func showBlurMenuButton(_ sender: Any) {
        if self.blurMenuUIView.tag == 100 {
            self.showBlurMenuView()
        } else {
            self.hideBlurMenuView()
        }
    }
    
    // MARK: Properties
    struct StoryBoard {
        static let nekoCellIdentifier = "NekoCellIdentifier"
    }
    
    var nekosArray = [NekoModel]()

    // MARK: Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        self.initNekoData()
        self.initNekoMenu()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning - MainViewController")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.nekoMenuButton.sendActions(for: .touchUpInside)
        self.hideBlurMenuView()
    }
    
    func initNekoData() {
        let nekoAlphabet = NekoModel(nekoJapanese: "Alphabet", nekoLatin: "nekoAlphabet", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "", nekoEnglish: "", nekoSound: "")
        let nekoMinnaNihongo = NekoModel(nekoJapanese: "Minna no Nihongo Lesson 1 ~ 50", nekoLatin: "nekoMinnaNihongo", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "", nekoEnglish: "", nekoSound: "")
        let nekoFlashCard = NekoModel(nekoJapanese: "Flashcards", nekoLatin: "nekoFlashCard", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "", nekoEnglish: "", nekoSound: "")
        self.nekosArray.append(nekoAlphabet)
        self.nekosArray.append(nekoMinnaNihongo)
        self.nekosArray.append(nekoFlashCard)
    }
    
    func initNekoMenu() {
        configureCircularMenuButton(button: self.nekoMenuButton, numberOfMenuItems: 3, menuRedius: 100, postion: .bottomRight)
        self.nekoMenuButton.setImage(UIImage(named: "cancel"), for: .selected)
        self.nekoMenuButton.menuButtonSize = .large
        self.nekoMenuButton.circularButtonAnimationSpeed = .fast
        self.nekoMenuButton.delegate =  self
    }
    
    func showBlurMenuView() {
        self.blurMenuUIView.tag = 101
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .transitionCrossDissolve, animations: {
            self.blurMenuUIView.alpha = 1.0
        }, completion: { (_) in
            self.blurMenuUIView.isHidden = false
        })
    }
    
    func hideBlurMenuView() {
        self.blurMenuUIView.tag = 100
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .transitionCrossDissolve, animations: {
            self.blurMenuUIView.alpha = 0.0
        }, completion: { (_) in
            self.blurMenuUIView.isHidden = true
        })
    }
}

// MARK: Extension - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nekosArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nekoCell = tableView.dequeueReusableCell(withIdentifier: StoryBoard.nekoCellIdentifier, for: indexPath) as! NekoTableViewCell
        let nekoItem = self.nekosArray[indexPath.row]
        nekoCell.nekoNameLabel.text = ""
        nekoCell.nekoNameLabel.text = nekoItem.nekoJapanese
        nekoCell.nekoImageView.image = nil
        nekoCell.nekoImageView.image = UIImage(named: "\(nekoItem.nekoLatin)")
        return nekoCell
    }
}

// MARK: Extension - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            //print("Alphabet")
            let AlphabetSelectionViewController = Constant.mainStoryBoard.instantiateViewController(withIdentifier: "AlphabetSelectionViewController") as! AlphabetSelectionViewController
            self.navigationController?.pushViewController(AlphabetSelectionViewController, animated: true)
            break
        case 1:
            //print("Minna no Nihongo 1 - 50")
            let MinnaNoNihongoSelectionViewController = Constant.mainStoryBoard.instantiateViewController(withIdentifier: "MinnaNoNihongoSelectionViewController") as! MinnaNoNihongoSelectionViewController
            self.navigationController?.pushViewController(MinnaNoNihongoSelectionViewController, animated: true)
            break
        case 2:
            //print("Flashcards")
            let FlashCardSelectionViewController = Constant.mainStoryBoard.instantiateViewController(withIdentifier: "FlashCardSelectionViewController") as! FlashCardSelectionViewController
            self.navigationController?.pushViewController(FlashCardSelectionViewController, animated: true)
            break
        default:
            break
        }
    }
}

// MARK: Extension - ASCircularButtonDelegate
extension MainViewController: ASCircularButtonDelegate {
    func buttonForIndexAt(_ menuButton: ASCircularMenuButton, indexForButton: Int) -> UIButton {
        let button: UIButton = UIButton()
        if menuButton == self.nekoMenuButton{
            button.setBackgroundImage(UIImage.init(named: "nekoMenu_\(indexForButton + 1)"), for: .normal)
        }
        return button
    }
    func didClickOnCircularMenuButton(_ menuButton: ASCircularMenuButton, indexForButton: Int, button: UIButton) {
        if menuButton == self.nekoMenuButton {
            self.hideBlurMenuView()
        }
        
        switch indexForButton {
        case 0:
            let UserFavouriteViewController = Constant.mainStoryBoard.instantiateViewController(withIdentifier: "UserFavouriteViewController") as! UserFavouriteViewController
            self.navigationController?.pushViewController(UserFavouriteViewController, animated: true)
            break
        case 1:
            break
        case 2:
            let NekoAboutUsViewController = Constant.mainStoryBoard.instantiateViewController(withIdentifier: "NekoAboutUsViewController") as! NekoAboutUsViewController
            self.present(NekoAboutUsViewController, animated: true, completion: nil)
            break
        default:
            break
        }
    }
}
