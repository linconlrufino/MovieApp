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

    init( title: String, url: URL) {
        self.title = title
        self.url = url
    }
}
