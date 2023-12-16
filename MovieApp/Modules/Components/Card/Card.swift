//
//  Card.swift
//  MovieApp
//
//  Created by Linconl Rufino on 03/12/23.
//

import Foundation

struct Card {
    var title : String
    var url : URL
    var rating : Double

    init( title: String, url: URL, rating: Double) {
        self.title = title
        self.url = url
        self.rating = rating
    }
}
