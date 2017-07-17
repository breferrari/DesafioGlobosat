//
//  MoviesViewControllerTests.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 16/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import XCTest
@testable import Desafio_Globosat

class MoviesViewControllerTests: XCTestCase {
    
    var moviesViewController: MoviesViewController!
    
    override func setUp() {
        super.setUp()
        
        moviesViewController = MoviesViewController()
        
        let bundle = Bundle(for: MoviesViewControllerTests.self)
        if let path = bundle.path(forResource: "TestMovies", ofType: "plist") {
            if let array = NSArray(contentsOfFile: path) as? [[String: Any]] {
                for item in array {
                    let movie = MyListMovie()
                    movie.id = item["id"] as! Int
                    movie.title = item["title"] as! String
                    movie.subtitle = item["subtitle"] as! String
                    movie.duration = item["duration"] as! String
                    movie.synopsis = item["synopsis"] as! String
                    movie.thumbnail = item["thumbnail"] as! String
                    
                    moviesViewController.movies.append(Movie(movie))
                }
            }
        }
    }
    
    func testTableViewHasExpectedItemsCount() {
        XCTAssert(moviesViewController.movies.count == 3)
    }
    
}
