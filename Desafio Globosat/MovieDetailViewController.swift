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
    
    var movie: Movie?
    
    let persistance = PersistanceService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMovieDetail()
        addToMyList()
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
        
    }

}
