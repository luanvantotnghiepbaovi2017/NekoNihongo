//
//  UserFavouriteViewController.swift
//  NekoNihongo
//
//  Created by Bao on 5/27/18.
//  Copyright © 2018 ViBao. All rights reserved.
//

import UIKit

class UserFavouriteViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var segmentUserFavouriteSection: UISegmentedControl!
    
    // MARK: IBActions
    @IBAction func segmentUserFavouriteAction(_ sender: Any) {
        print(segmentUserFavouriteSection.selectedSegmentIndex)
        NotificationCenter.default.post(name: Notification.Name.updateSelectedUserFavouriteSection, object: nil, userInfo: [Constant.kUserFavouriteSectionIndex: segmentUserFavouriteSection.selectedSegmentIndex])
    }
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favourites"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning - UserFavouriteViewController")
    }
    
    deinit {
        print("deinit")
        NotificationCenter.default.removeObserver(self, name: Notification.Name.updateSelectedUserFavouriteSection, object: nil)
    }

    func updateSegmentSelectedIndex(value: Int) {
        segmentUserFavouriteSection.selectedSegmentIndex = value
    }
    
}
