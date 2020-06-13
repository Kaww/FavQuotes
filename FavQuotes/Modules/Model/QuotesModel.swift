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
        self.quotes = QuotesService.shared.getQuotes()
        quotesController?.onQuotesRetrieval(quotes: self.quotes)
    }
    
}
