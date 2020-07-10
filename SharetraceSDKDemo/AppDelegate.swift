//
//  AppDelegate.swift
//  Demo
//
//  Created by Sharetrace on 2020/4/7.
//  Copyright © 2020 Sharetrace. All rights reserved.
//

import UIKit
import SharetraceSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpWindow()
        Sharetrace.start()
        return true
    }
    
    func setUpWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        window?.rootViewController = vc
    }


}


