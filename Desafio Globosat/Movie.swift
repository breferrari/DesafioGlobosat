//
//  Movie.swift
//  Desafio Globosat
//
//  Created by Brenno Ferrari on 14/07/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

import UIKit
import Contentful

class Movie: NSObject {
    
    static var contentTypeId: ContentTypeId = "Movie"
    let entry: Entry
    
    var id: String
    var title: String
    var subtitle: String
    var duration: String
    var synopsis: String
    var thumbnail: URL?
    
    required init(_ entry: Entry) {
        self.entry = entry
        
        self.id = entry.id
        self.title = entry.fields["title"] as? String ?? "No Title Available"
        self.subtitle = entry.fields["subtitle"] as? String ?? "No Subtitle Available"
        self.duration = entry.fields["duration"] as? String ?? "No Duration Available"
        self.synopsis = entry.fields["synopsis"] as? String ?? "No Synopsis Available"
        
        if let thumbnailFields = entry.fields["thumbnail"] as? Link {
            if let thumbnailAsset: Asset = thumbnailFields.asset {
                if let file = thumbnailAsset.fields["file"] as? [String:Any] {
                    if let urlString = file["url"] as? String {
                        self.thumbnail = URL(string: "http:\(urlString)")!
                    }
                }
            }
        }
    }
}
