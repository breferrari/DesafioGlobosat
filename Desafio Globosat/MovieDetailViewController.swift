//
//  MovieDetailViewController.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 15/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit
import SDWebImage
import RealmSwift

class MovieDetailViewController: BaseViewController {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var synopsisTextView: UITextView!
    
    @IBOutlet weak var watchedView: UIView!
    @IBOutlet weak var watchedSwitch: UISwitch!
    
    var movie: Movie?
    var myListMovie: MyListMovie?
    
    let persistance = PersistanceService.shared
    var isMovieOnMyList = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMovieDetail()
        
        if let movie = movie {
            isMovieOnMyList = persistance.isMovieOnMyList(name: movie.title)
            
            if isMovieOnMyList {
                watchedView.isHidden = false
                persistance.fetchMovieNamed(movie.title, completion: { [weak self] (movies) in
                    self?.myListMovie = movies.first
                    if let myListMovie = self?.myListMovie {
                        self?.watchedSwitch.isOn = myListMovie.didWatch
                    }
                })
            } else {
                watchedView.isHidden = true
            }
        }
        
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        let barButton: UIBarButtonItem
        if !isMovieOnMyList {
            barButton = UIBarButtonItem.init(title: "Add To List", style: UIBarButtonItemStyle.plain, target: self, action: #selector(addToMyList))
        } else {
            barButton = UIBarButtonItem.init(title: "Remove From List", style: UIBarButtonItemStyle.plain, target: self, action: #selector(removeFromMyList))
        }
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func configureMovieDetail() {
        if let movie = movie {
            thumbnailImageView.sd_setShowActivityIndicatorView(true)
            thumbnailImageView.sd_setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
            self.thumbnailImageView.sd_setImage(with: movie.thumbnail)
            
            self.titleLabel.text = movie.title
            self.subtitleLabel.text = movie.subtitle
            self.durationLabel.text = movie.duration
            self.synopsisTextView.text = movie.synopsis
        }
    }
    
    func addToMyList() {
        if !isMovieOnMyList {
            if let movie = movie {
                myListMovie = MyListMovie(movie)
                if let myListMovie = self.myListMovie {
                    watchedSwitch.isOn = myListMovie.didWatch
                }
                
                if let myListMovie = myListMovie {
                    persistance.addOrUpdateMovie(myListMovie)
                    isMovieOnMyList = true
                    watchIsHidden(false)
                    configureNavigationBar()
                }
                
            }
        }
    }
    
    func removeFromMyList() {
        if isMovieOnMyList {
            if let myListMovie = myListMovie {
                persistance.deleteMovie(myListMovie)
                self.myListMovie = nil
                isMovieOnMyList = false
                watchIsHidden(true)
                configureNavigationBar()
            }
        }
    }
    
    func watchIsHidden(_ value: Bool) {
        UIView.animate(withDuration: 0.5) { 
            self.watchedView.isHidden = value
        }
    }
    
    @IBAction func watchedAction(_ sender: UISwitch) {
        if let myListMovie = myListMovie {
            try! persistance.realm.write {
                myListMovie.didWatch = sender.isOn
            }
        }
    }

}
