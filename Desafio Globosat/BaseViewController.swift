//
//  BaseViewController.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 15/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController {

    func showLoading() {
        SVProgressHUD.show()
    }
    
    func showLoadingWithStatus(_ status: String) {
        SVProgressHUD.show(withStatus: status)
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showAlertWithMessage(_ message: String) {
        let alert = UIAlertController.init(title: nil, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
