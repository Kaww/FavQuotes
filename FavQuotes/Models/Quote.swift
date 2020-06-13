//
//  Quote.swift
//  FavQuotes
//
//  Created by kaww on 13/06/2020.
//  Copyright © 2020 Kaww. All rights reserved.
//

import Foundation


struct Quote: Codable {
    var author: String
    var body: String
    var favorites_count: Int
    var tags: [String]
}

struct QuotesObjectRequest: Codable {
    var quotes: [Quote]
}
