//
//  AlphabetStrokeOrderDoubleCharacterViewController.swift
//  NekoNihongo
//
//  Created by Bao on 10/4/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

import UIKit

class AlphabetStrokeOrderDoubleCharacterViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var webView01: UIWebView!
    
    @IBOutlet weak var webView02: UIWebView!
    
    var svgImage01: String!
    
    var svgImage02: String!
    
    var timeDelay = 4.2
    
    var titleString: String!
    
//    deinit {
//        print("deinit")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView01.isOpaque = false
        self.webView01.backgroundColor = .clear
        
        self.webView02.isOpaque = false
        self.webView02.backgroundColor = .clear
        
        self.setUpDelayTime {
            
            self.reloadWebView()
            
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
    
    // MARK: IBActions
    
    @IBAction func reloadWebView(_ sender: Any) {
        
        self.webView02.loadHTMLString("", baseURL: nil)
        
        self.reloadWebView()
        
    }
    
    // MARK: Functions
    
    func setUpDelayTime(completion: @escaping () -> ()) {
        
        if self.titleString == "Hiragana" {
            
            if self.svgImage01 == "ぎ" {
                
                self.timeDelay = 4.5
                
            }
            else if self.svgImage01 == "し" {
                
                self.timeDelay = 1.9
                
            }
            else if self.svgImage01 == "じ" || self.svgImage01 == "り" {
                
                self.timeDelay = 2.5
                
            }
            else if self.svgImage01 == "ち" {
                
                self.timeDelay = 2.4
                
            }
            else if self.svgImage01 == "ぢ" {
                
                self.timeDelay = 3.8
                
            }
            else if self.svgImage01 == "に" {
                
                self.timeDelay = 3.5
                
            }
            else if self.svgImage01 == "ひ" {
                
                self.timeDelay = 2.0
                
            }
            else if self.svgImage01 == "び" ||  self.svgImage01 == "ぴ" {
                
                self.timeDelay = 2.8
                
            }
            else if self.svgImage01 == "み" {
                
                self.timeDelay = 3.0
                
            }
            
        } else {
            
            if self.svgImage01 == "キ" {
                
                self.timeDelay = 3.5
                
            }
            else if self.svgImage01 == "シ" {
                
                self.timeDelay = 2.0
                
            }
            else if self.svgImage01 == "ジ" {
                
                self.timeDelay = 2.9
                
            }
            else if self.svgImage01 == "チ" {
                
                self.timeDelay = 3.3
                
            }
            else if self.svgImage01 == "ヂ" {
                
                self.timeDelay = 4.7
                
            }
            else if self.svgImage01 == "ニ" {
                
                self.timeDelay = 2.4
                
            }
            else if  self.svgImage01 == "ヒ" {
                
                self.timeDelay = 2.8
                
            }
            else if self.svgImage01 == "ミ" {
                
                self.timeDelay = 1.8
                
            }
            else if self.svgImage01 == "リ" {
                
                self.timeDelay = 2.2
                
            }
            
        }
        
        completion()
        
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    func reloadWebView() {
        
        if let path = Bundle.main.path(forResource: self.svgImage01, ofType: "svg") {
            
            let fileURL:URL = URL(fileURLWithPath: path)
            
            let req = URLRequest(url: fileURL)
            
            self.webView01.loadRequest(req)
            
            self.delayWithSeconds(self.timeDelay, completion: {
                
                if let path = Bundle.main.path(forResource: "s\(self.svgImage02!)", ofType: "svg") {
                    
                    let fileURL:URL = URL(fileURLWithPath: path)
                    
                    let req = URLRequest(url: fileURL)
                    
                    self.webView02.loadRequest(req)
                    
                }
                
            })
            
        }
        
    }
}
