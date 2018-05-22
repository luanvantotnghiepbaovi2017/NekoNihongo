//
//  MinnaLessonDataProvider.swift
//  NekoNihongo
//
//  Created by Bao on 11/26/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

class MinnaLessonDataProvider: NSObject {
    // MARK: Properties
    static let shared = MinnaLessonDataProvider()
    // MARK: Methods
    private override init() {}
    func getMinnaLessonByOrderNumber(orderNumber: Int, completion: ([NekoModel]?, Error?) -> Void) {
        guard let path = Bundle.main.path(forResource: Constant.minnaLessonName + "\(orderNumber)", ofType: Constant.minnaLessonFileType) else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            do {
                let minnaNihongoData = try JSONDecoder().decode([NekoModel].self, from: data)
                completion(minnaNihongoData, nil)
            } catch let error {
                completion(nil, error)
            }
        } catch let error {
            completion(nil, error)
        }
    }
}
