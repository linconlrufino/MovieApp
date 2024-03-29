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
    var genre: [String]
    var duration: String

    init( title: String, url: URL, rating: Double, genre: [String], duration: String) {
        self.title = title
        self.url = url
        self.rating = rating
        self.genre = genre
        self.duration = duration
    }
}
