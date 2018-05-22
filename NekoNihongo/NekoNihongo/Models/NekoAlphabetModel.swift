//
//  NekoAlphabetModel.swift
//  NekoNihongo
//
//  Created by Bao on 9/20/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

struct NekoAlphabetModel: Decodable {
    var nekoJapaneseCharacter: String
    var nekoLatinCharacter: String
    
    init(nekoJapaneseCharacter: String, nekoLatinCharacter: String) {
        self.nekoLatinCharacter = nekoLatinCharacter
        self.nekoJapaneseCharacter = nekoJapaneseCharacter
    }
}
