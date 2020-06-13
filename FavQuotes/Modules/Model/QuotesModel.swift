//
//  QuotesModel.swift
//  FavQuotes
//
//  Created by kaww on 13/06/2020.
//  Copyright © 2020 Kaww. All rights reserved.
//

import Foundation


class QuotesModel {
    var quotesController: QuotesModelOutput?
    
    private var quotes = [Quote]()
    
}


// MARK: - Controller Input
extension QuotesModel: QuotesControllerInput {
    
    func retrieveQuotes() {
        QuotesService.shared.getQuotes { [weak self] quotes in
            print("get quotes from network using stored existing user -\(DefaultsService.shared.getUser()!)-")
            self?.quotes = quotes
            DefaultsService.shared.createQuotes(quotes: (self?.quotes)!)
            self?.quotesController?.onQuotesRetrieval(quotes: (self?.quotes)!)
        }
        
        self.quotes = DefaultsService.shared.getQuotes()
        quotesController?.onQuotesRetrieval(quotes: self.quotes)
    }
    
    func retrieveQuotes(username: String) {
        QuotesService.shared.getQuotes(username: username) { [weak self] quotes in
            print("get quotes from network from new user -\(DefaultsService.shared.getUser()!)-")
            self?.quotes = quotes
            DefaultsService.shared.createQuotes(quotes: (self?.quotes)!)
            self?.quotesController?.onQuotesRetrieval(quotes: (self?.quotes)!)
        }
    }
    
}
