//
//  NekoModel.swift
//  NekoNihongo
//
//  Created by Bao on 9/11/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

import UIKit

class NekoModel: Decodable {
    var nekoJapanese: String = ""
    var nekoLatin: String = ""
    var nekoKanji: String = ""
    var nekoKanjiHanViet: String = ""
    var nekoVietNamese: String = ""
    var nekoEnglish: String = ""
    var nekoSound: String = ""
    var nekoTotalHeight: CGFloat = 0.0
    
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case nekoJapanese = "nekoJapanese"
        case nekoLatin = "nekoLatin"
        case nekoKanji = "nekoKanji"
        case nekoKanjiHanViet = "nekoKanjiHanViet"
        case nekoVietNamese = "nekoVietNamese"
        case nekoEnglish = "nekoEnglish"
        case nekoSound = "nekoSound"
    }
    
    // MARK: Constructor
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        nekoJapanese = try container.decodeIfPresent(String.self, forKey: .nekoJapanese) ?? ""
        nekoLatin = try container.decodeIfPresent(String.self, forKey: .nekoLatin) ?? ""
        nekoKanji = try container.decodeIfPresent(String.self, forKey: .nekoKanji) ?? ""
        nekoKanjiHanViet = try container.decodeIfPresent(String.self, forKey: .nekoKanjiHanViet) ?? ""
        nekoVietNamese = try container.decodeIfPresent(String.self, forKey: .nekoVietNamese) ?? ""
        nekoEnglish = try container.decodeIfPresent(String.self, forKey: .nekoEnglish) ?? ""
        nekoSound = try container.decodeIfPresent(String.self, forKey: .nekoSound) ?? ""
    }
    
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
