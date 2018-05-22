//
//  NekoModel.swift
//  NekoNihongo
//
//  Created by Bao on 9/11/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

struct NekoModel {
    
    var nekoJapanese: String
    var nekoLatin: String
    var nekoKanji: String
    var nekoKanjiHanViet: String
    var nekoVietNamese: String
    var nekoEnglish: String
    var nekoSound: String
    
    init(nekoJapanese: String, nekoLatin: String, nekoKanji: String, nekoKanjiHanViet: String, nekoVietNamese: String, nekoEnglish: String, nekoSound: String) {
        
        self.nekoJapanese = nekoJapanese
        self.nekoLatin = nekoLatin
        self.nekoKanji = nekoKanji
        self.nekoKanjiHanViet = nekoKanjiHanViet
        self.nekoVietNamese = nekoVietNamese
        self.nekoEnglish = nekoEnglish
        self.nekoSound = nekoSound
        
    }
    
}
