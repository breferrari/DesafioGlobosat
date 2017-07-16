//
//  MoviesViewController.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 15/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit

class MoviesViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    let service = GlobosatService.shared
    
    var movies: Array<Movie> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadMovies()
    }
    
    func configureTableView() {
        moviesTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieTableViewCell.cellIdentifier())
        moviesTableView.estimatedRowHeight = 160
        moviesTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func loadMovies() {
        showLoading()
        service.fetchMovies { [weak self] (movies) in
            if let movies = movies {
                self?.movies = movies
                DispatchQueue.main.async {
                    self?.moviesTableView.reloadData()
                }
            }
            
            self?.hideLoading()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination.isKind(of: MovieDetailViewController.classForCoder()) && sender != nil {
            let destionation = segue.destination as! MovieDetailViewController
            destionation.movie = sender as? Movie
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MovieDetailSegue", sender: movies[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = MovieTableViewCell.cellIdentifier()
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        cell.setMovie(movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
