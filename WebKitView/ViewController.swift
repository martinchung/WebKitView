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
        
        //MARK: Get settings
        
        let defaults = UserDefaults.standard // appDefaults = [String: Any]()
        
        var urlString = defaults.object(forKey: "theURL") as! String?
        
        // check if we do have the URL to open in app settings and open it if we do
        if urlString == nil {

            /*
                     let settingsUrl = Bundle.main.path(forResource: "Settings",  ofType: "bundle")!.appendingPathComponent("Root.plist")
                    
                    let settingsPlist = NSDictionary(contentsOf: settingsUrl)!
                    let preferences = settingsPlist["PreferenceSpecifiers"] as! [NSDictionary]
            */

            urlString = "https://www.apple.ca"      //TODO: Retrieve default url from settings bundle
            defaults.set(urlString, forKey: "theURL")
        }
        
        let url = URL(string: urlString!)
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

