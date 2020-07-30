//
//  ViewController.swift
//  Demo
//
//  Created by Sharetrace on 2020/4/7.
//  Copyright © 2020 Sharetrace. All rights reserved.
//

import UIKit
import SharetraceSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getParamsAction(_ sender: Any) {
        Sharetrace.getInstallTrace ({[weak self] (traceData) in
            guard let self = self else {
                return
            }
            
            self.showParams(traceData)
        }) {[weak self] (code, message) in
            guard let self = self else {
                return
            }
            print("code: \(code), message: \(message)")
            self.showFailResult(code, msg: message)
        }
        
    }
    
    func showParams(_ appData: AppData?) {
        var message = ""
        if let appData = appData {
            message = "appData: \n \(appData.paramsData) \n \(appData.resumePage)"
        }
        
        let alertController = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    func showFailResult(_ code: Int, msg: String) {
        let message = "code: \(code), msg: \(msg)"
        let alertController = UIAlertController(title: "Fail", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
}

