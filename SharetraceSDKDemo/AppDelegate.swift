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
        // 如需禁用SharetraceSDK访问系统剪贴板，若禁用会影响匹配成功率
//        Sharetrace.disableClipboard()
        Sharetrace.initWith(self)
        setUpWindow()
        return true
    }
    
    func setUpWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        window?.rootViewController = vc
    }
    
    //适用目前所有iOS版本
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        if (Sharetrace.handleSchemeLinkURL(url)) {
            return true;
        }
        
        // 其他处理
        return true
    }
    
    //iOS9以上
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if (Sharetrace.handleSchemeLinkURL(url)) {
            return true;
        }
        
        // 其他处理
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if (Sharetrace.handleUniversalLink(userActivity)) {
            return true;
        }
        
        // 其他处理
        return true
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


