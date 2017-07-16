//
//  MovieTableViewCell.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 16/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    class func cellIdentifier() -> String {
        return "MovieTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        thumbnailImageView.image = nil
        titleLabel.text = ""
        subtitleLabel.text = ""
        durationLabel.text = ""
    }

    func setMovie(_ movie: Movie) {
        thumbnailImageView.sd_setShowActivityIndicatorView(true)
        thumbnailImageView.sd_setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
        thumbnailImageView.sd_setImage(with: movie.thumbnail)
        titleLabel.text = movie.title
        subtitleLabel.text = movie.subtitle
        durationLabel.text = movie.duration
    }
    
}
