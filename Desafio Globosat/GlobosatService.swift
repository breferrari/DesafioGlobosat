//
//  GlobosatService.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 14/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit
import Contentful
import Interstellar

// MARK: Contentful Keys
let SPACE_ID = "ia42bzqpp0dg"
let ACCESS_TOKEN_DELIVERY = "df95635ce4cb3aa18919615e93d10c63d1a4e256cf33ad3803b3d130294dd9e9"
let ACCESS_TOKEN_PREVIEW = "b1a103f1d5ae888f36acfa24f223859843d34485ffeab1402bd09d4fceec7864"

class GlobosatService: NSObject {
    
    // MARK: Singleton class - Init blocked
    private override init() {}
    
    // MARK: Shared Instance
    static let shared = GlobosatService()
    
    // MARK: Contentful Service Client
    let client = Client(spaceId: SPACE_ID, accessToken: ACCESS_TOKEN_DELIVERY)
    
    func fetch() {
        client.fetchEntries() { [weak self] (result: Result<ArrayResponse<Entry>>) in
            switch result {
            case .success(let array):
                
                var movies: Array<Movie> = []
                for entry in array.items {
                    movies.append(Movie(entry))
                }
                
            case .error(let error):
                self?.handle(error: error)
            }
        }
    }
    
    func handle(error: Error) {
        print("[GlobosatService] Error: \(error)")
    }
}
