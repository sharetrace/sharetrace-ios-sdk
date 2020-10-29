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
        Sharetrace.initWith(self)
        return true 
    }
    
    func setUpWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        window?.rootViewController = vc
    }
}

extension AppDelegate: SharetraceDelegate {
    
    func getWakeUpTrace(_ appData: AppData?) {
        if let appData = appData {
            showWakeResult(title: "getWakeUpTrace", msg: appData.paramsData)
        } else {
            showWakeResult(title: "getWakeUpTrace", msg: "Failed to getWakeUpTrace!")
        }
    }
    
    func showWakeResult(title: String, msg: String) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(action)
        self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}


