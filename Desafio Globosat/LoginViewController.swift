//
//  LoginViewController.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 15/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let authentication = AuthenticationService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.keyboardDismissMode = .onDrag
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        guard let user = userTextField.text else {
            return
        }
        
        guard let password = passwordTextField.text else {
            return
        }
        
        showLoading()
        authentication.doLogin(user: user, password: password) { [weak self] (isLoggedIn) in
            self?.hideLoading()
            
            if (isLoggedIn) {
                self?.performSegue(withIdentifier: "HomeSegue", sender: nil)
            } else {
                self?.userTextField.text = ""
                self?.passwordTextField.text = ""
                self?.view.endEditing(true)
                self?.showAlertWithMessage("Wrong user or password")
            }
        }
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField.text == userTextField.text) {
            passwordTextField.becomeFirstResponder()
            return true
        } else if (textField == passwordTextField) {
            loginAction(loginButton)
            return true
        }
        
        return false
    }

}
