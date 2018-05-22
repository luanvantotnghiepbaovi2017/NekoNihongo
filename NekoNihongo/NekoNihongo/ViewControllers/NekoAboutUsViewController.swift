//
//  NekoAboutUsViewController.swift
//  NekoNihongo
//
//  Created by Bao on 11/6/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

import UIKit

class NekoAboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    
    @IBAction func closeViewButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
