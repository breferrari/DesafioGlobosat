//
//  MoviesViewControllerIntegrationTests.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 17/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import XCTest
@testable import Desafio_Globosat

class MoviesViewControllerIntegrationTests: XCTestCase {
    
    var moviesViewController: MoviesViewController!
    
    override func setUp() {
        super.setUp()
        moviesViewController = MoviesViewController()
    }
    
    func testLoadMoviesFails() {
        // given
        let expectation = self.expectation(description: "Expected load movies to fail")
        
        // when
        moviesViewController.service.fetchMovies { (movies) in
            expectation.fulfill()
            XCTAssert((movies?.count)! > 0)
        }
        
        // then
        waitForExpectations(timeout: 3, handler: nil)
    }
    
}
