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
            print("quotes from network")
            self?.quotes = quotes
            self?.quotesController?.onQuotesRetrieval(quotes: (self?.quotes)!)
        }
        // fetch from user defaults
        print("quote from defaults")
        quotesController?.onQuotesRetrieval(quotes: self.quotes)
    }
    
}
