//
//  Constant.swift
//  NekoNihongo
//
//  Created by Bao on 11/26/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

struct Constant {
    // MARK: Storyboard
    static let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    // MARK: Files name, files type
    static let minnaLessonName = "Neko-Minna-Nihongo-Lesson-"
    static let minnaLessonFileType = "json"
    // MARK: Fonts
    static let font20B = UIFont(name: "BalsamiqSansBold", size: 20) ?? UIFont.systemFont(ofSize: 20)
    static let font20R = UIFont(name: "BalsamiqSansRegular", size: 20) ?? UIFont.systemFont(ofSize: 20)
    static let font16R = UIFont(name: "VNF-ComicSans", size: 16) ?? UIFont.systemFont(ofSize: 16)
    // MARK: Colors
    static let color19B = UIColor(red: 69.0/255.0, green: 134.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static let color19R = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
    static let color16R = UIColor(red: 32.0/255.0, green: 147.0/255.0, blue: 188.0/255.0, alpha: 1.0)
    // Notification Keys
    static let kUserFavouriteSectionIndex: String = "kUserFavouriteSectionIndex"
}
