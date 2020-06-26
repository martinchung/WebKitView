//
//  AppDelegate.swift
//  WebKitView
//
//  Created by Martin Chung on 2020-06-23.
//  Copyright © 2020 Martin Chung. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    

    // implement this method to load settings at startup
    internal func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.registerDefaultsFromSettingsBundle()
        return true
    }


    func registerDefaultsFromSettingsBundle(){
        guard let bundleURL = Bundle.main.url(forResource: "Settings", withExtension: "bundle") else {
            NSLog("Could not find Settings.bundle")
            return
        }

        guard let settings = NSDictionary(contentsOf: bundleURL.appendingPathComponent("Root.plist")) else {
            NSLog("Could not read Root.plist")
            return
        }
        
        // iterate through "PreferenceSpecifiers" aka Preference Items in plist
        let preferences = settings["PreferenceSpecifiers"] as! NSArray
        var defaultsToRegister = [String: AnyObject]()

        for prefSpecificationItem in preferences {
            if let prefDictionary = prefSpecificationItem as? [String: AnyObject] {
                // if this dictionary has entries for "Key" and "DefaultValue", it's a default value we can pull out
                guard let key = prefDictionary["Key"] as? String, let defaultValue = prefDictionary["DefaultValue"] else {
                    continue
                }
                NSLog("Setting object \(String(describing: defaultValue)) for key \(key)")
                defaultsToRegister[key] = defaultValue
            }
        }
        UserDefaults.standard.register(defaults: defaultsToRegister)
    }
}

