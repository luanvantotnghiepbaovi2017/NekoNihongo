//
//  AlphabetStrokeOrderViewController.swift
//  NekoNihongo
//
//  Created by Bao on 10/3/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

import UIKit

class AlphabetStrokeOrderViewController: UIViewController, UIWebViewDelegate {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var webView: UIWebView!
    
    // MARK: Variables
    
    var svgImage: String!
    
//    deinit {
//        print("deinit")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.webView.delegate = self
        
        self.webView.isOpaque = false
        self.webView.backgroundColor = .clear
        
        if self.svgImage == "ペ" {
            
            self.svgImage = "pe_katakana"
            
        }
        
        if let path = Bundle.main.path(forResource: svgImage, ofType: "svg") {
            
            let fileURL:URL = URL(fileURLWithPath: path)
            
            let req = URLRequest(url: fileURL)
            
            self.webView.loadRequest(req)
            
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view?.tag != 100 {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    // MARK:
    
    @IBAction func reloadWebView(_ sender: Any) {
        
        self.webView.reload()
        
    }
    
    
}
