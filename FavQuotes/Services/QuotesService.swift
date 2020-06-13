//
//  QuotesService.swift
//  FavQuotes
//
//  Created by kaww on 13/06/2020.
//  Copyright © 2020 Kaww. All rights reserved.
//

import Foundation


class QuotesService {
    static let shared = QuotesService(baseURL: "https://favqs.com/api/quotes/")
    
    let baseURL: String
    private let headers = [
        "Authorization": "Token 7ba7e70067a67db23bca653b3e568576",
        "Content-Type": "application/json"
    ]
    
    var loggedUser: User?
    
    private init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func getQuotes() -> [Quote] {
        let quote = Quote(author: "Kaww", body: "quote body", favorite_count: 42, tags: ["love", "motivation"])
        
        return [quote, quote, quote, quote, quote, quote, quote, quote, quote, quote, quote, quote]
    }
}
