//
//  AppManager.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 15/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

class AppManager {
    
    class func appDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    class func setRootViewController(_ viewController: UIViewController) {
        appDelegate().setRootViewController(viewController)
    }
    
    class func resetApp() {
        let authenticationStoryboard = UIStoryboard.init(name: "Authentication", bundle: Bundle.main)
        if let initialViewController = authenticationStoryboard.instantiateInitialViewController() {
            setRootViewController(initialViewController)
        }
    }
}
