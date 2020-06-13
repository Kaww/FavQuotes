//
//  QuotesViewController.swift
//  FavQuotes
//
//  Created by kaww on 13/06/2020.
//  Copyright © 2020 Kaww. All rights reserved.
//

import UIKit


class QuotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FavQuotes"
        self.view = quotesView as? UIView
    }

    // MARK: - Properties
    var quotesView: QuotesControllerOutput?
    var quotesModel: QuotesControllerInput?
    
}


// MARK: - View Input
extension QuotesViewController: QuotesViewInput {
    func onViewLayout() {
        quotesModel?.retrieveQuotes()
    }
    
    func onUserSelected(username: String) {
        quotesModel?.retrieveQuotes(username: username)
    }
    
}


// MARK: - Model Output
extension QuotesViewController: QuotesModelOutput {
    func onQuotesRetrieval(quotes: [Quote]) {
        self.quotesView?.onQuotesRetrieval(quotes: quotes)
    }
    
}
