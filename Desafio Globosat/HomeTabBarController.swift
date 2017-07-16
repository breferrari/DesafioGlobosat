//
//  HomeTabBarController.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 15/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeTabBarController: UITabBarController {
    
    let authentication = AuthenticationService.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Desafio Globosat"
        
        let barButtonItem = UIBarButtonItem.init(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem = barButtonItem
    }

    func logout() {
        let alert = UIAlertController(title: "Logout", message: "Do you really want to logout?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive, handler: { (action) in
            SVProgressHUD.show()
            self.authentication.logoff {
                SVProgressHUD.dismiss()
                AppManager.resetApp()
            }
        }))
        
        present(alert, animated: true, completion: nil)
    }

}
