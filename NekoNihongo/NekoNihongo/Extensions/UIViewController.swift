//
//  UIViewController.swift
//  NekoNihongo
//
//  Created by Bao on 9/12/17.
//  Copyright © 2017 ViBao. All rights reserved.
//
import UIKit

extension UIViewController {
    func setBackButton(){
        let yourBackImage = UIImage(named: "back")
        navigationController?.navigationBar.backIndicatorImage = yourBackImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
    }
}
