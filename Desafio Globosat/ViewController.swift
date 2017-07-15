//
//  ViewController.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 13/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let service = GlobosatService.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }

    func loadMovies() {
        service.fetchMovies { (movies) in
            if movies != nil {
                print("Movies OK")
            }
        }
    }


}

