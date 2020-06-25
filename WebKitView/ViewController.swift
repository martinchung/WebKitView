//
//  ViewController.swift
//  WebKitView
//
//  Created by Martin Chung on 2020-06-23.
//  Copyright © 2020 Martin Chung. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://www.apple.ca")
        let request = URLRequest(url: url!)
        
        webView.load(request)
    }

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    

}

