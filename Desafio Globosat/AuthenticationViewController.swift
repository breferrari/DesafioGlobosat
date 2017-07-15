//
//  ViewController.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 13/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

class AuthenticationViewController: BaseViewController {
    
    let authentication = AuthenticationService.shared
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: Remove this later
        authentication.isLoggedIn = false
        
        checkLogin()
    }
    
    func checkLogin() {
        // Mocking a requisition connection to verify login
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            if self.authentication.isLoggedIn {
                self.performSegue(withIdentifier: "HomeSegue", sender: nil)
            } else {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
        }
    }
    
}

