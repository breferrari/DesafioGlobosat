//
//  MyListViewController.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 15/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

class MyListViewController: BaseViewController, UITableViewDelegate {

    @IBOutlet weak var myListTableView: UITableView!
    
    var movies: Array<Movie> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }
    
    func configureTableView() {
        myListTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieTableViewCell.cellIdentifier())
        myListTableView.estimatedRowHeight = 160
        myListTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Open Movie Details
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = MovieTableViewCell.cellIdentifier()
        let cell = myListTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        cell.setMovie(movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

}
