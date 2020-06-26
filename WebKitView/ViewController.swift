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
        let urlString = defaults.string(forKey: "theURL")

        // NotificationCenter.default.addObserver(self, selector: #selector(settingChanged(notification:)), name: UserDefaults.didChangeNotification, object: nil)
        
        loadPage(url: urlString!)
        
    }

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    
    func loadPage(url: String) {
        let url = URL(string: url)
        let request = URLRequest(url: url!)
        
        webView.load(request)
    }
    
    
    @objc func settingChanged(notification: NSNotification) {
        if let defaults = notification.object as? UserDefaults {
            if let setting = defaults.string(forKey: "theURL") {
                print("setting changed to " + setting)
                loadPage(url: setting)
            }
        }
    }
    
    func registerSettingsBundle() {
        let appDefaults = [String: AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }

    

    
    
    
    
}

