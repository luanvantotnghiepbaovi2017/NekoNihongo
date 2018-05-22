//
//  HelperFunction.swift
//  NekoNihongo
//
//  Created by Bao on 11/2/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

class HelperFunction {
    static func attributeTextOnLabel(mainString: String, childString: [String], color: [UIColor], font: [UIFont], label: UILabel) {
        let attribute = NSMutableAttributedString.init(string: mainString)
        for index in 0...childString.count - 1 {
            let color = color[index]
            let range = (mainString as NSString).range(of: childString[index])
            attribute.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
            if index == 0 {
                let font = font[index]
                attribute.addAttribute(NSAttributedStringKey.font, value: font, range: range)
            }
        }
        
        let font = UIFont(name: "BalsamiqSansBold", size: 20) ?? UIFont.systemFont(ofSize: 20)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 0.5 * font.lineHeight
        attribute.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attribute.length))
        label.attributedText = attribute
    }
    static func getCountOfFileInFolderWithPrefix(fileNamePrefix: String, completion: (Int?, Error?) -> Void) {
//        guard let bundleFileUrls = Bundle.main.urls(forResourcesWithExtension: extensionType, subdirectory: nil) else { return -1 }
        if let resourcePath = Bundle.main.resourcePath {
            do {
                let fileCount = try FileManager().contentsOfDirectory(atPath: resourcePath).filter{ $0.hasPrefix(fileNamePrefix) }.count
                completion(fileCount, nil)
            } catch let error {
                completion(nil, error)
            }
        }
    }
}
