//
//  PersistanceService.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 16/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit
import RealmSwift

class PersistanceService: NSObject {

    // MARK: Singleton class - Init blocked
    private override init() {}
    
    // MARK: Shared Instance
    static let shared = PersistanceService()
    
    let realm = try! Realm()
    
    func addOrUpdateMovie(_ movie: MyListMovie) {
        try! realm.write {
            realm.add(movie)
        }
    }
    
    func fetchMovies(_ completion: (Results<MyListMovie>) -> Void) {
        completion(realm.objects(MyListMovie.self))
    }
    
    func fetchMovieNamed(_ name: String, completion: (Results<MyListMovie>) -> Void) {
        completion(realm.objects(MyListMovie.self).filter("title == '\(name)'"))
    }
    
    func isMovieOnMyList(name: String) -> Bool {
        let objects = realm.objects(MyListMovie.self).filter("title == '\(name)'")
        return objects.count > 0
    }
    
    func deleteMovie(_ movie: MyListMovie) {
        try! realm.write {
            realm.delete(movie)
        }
    }
}
