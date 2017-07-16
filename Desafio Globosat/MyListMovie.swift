//
//  MyListMovie.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 16/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import Foundation
import RealmSwift

class MyListMovie: Object {
    
    dynamic var id = 0
    dynamic var title = ""
    dynamic var subtitle = ""
    dynamic var duration = ""
    dynamic var synopsis = ""
    dynamic var thumbnail = ""
    dynamic var didWatch = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(MyListMovie.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
}

extension MyListMovie {
    
    convenience init(_ movie: Movie) {
        self.init()

        id = incrementID()
        title = movie.title
        subtitle = movie.subtitle
        duration = movie.duration
        synopsis = movie.synopsis
        if let thumbnailUrl = movie.thumbnail {
            thumbnail = "\(thumbnailUrl)"
        }
        didWatch = false
    }
    
}
