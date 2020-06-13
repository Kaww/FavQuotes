//
//  QuotesContract.swift
//  FavQuotes
//
//  Created by kaww on 13/06/2020.
//  Copyright © 2020 Kaww. All rights reserved.
//

import Foundation


/// *View* sends user actions to the *Controller*.
///
/// **Controller** conforms to this protocol
protocol QuotesViewInput: class {
    var quotesView: QuotesControllerOutput? { get set }
    var quotesModel: QuotesControllerInput? { get set }
    
    func onViewLayout()
    func onUserChanged()
    
}


/// *Controller* tells the *Model* what to do based on the input
///
/// **Model** conforms to this protocol
protocol QuotesControllerInput: class {
    var quotesController: QuotesModelOutput? { get set }
    
    func retrieveQuotes()
    
}


/// *Model* returns the result to the *Controller*
///
/// **Controller** conforms to this protocol
protocol QuotesModelOutput: class {
    func onQuotesRetrieval(quotes: [Quote])
    
}


/// *Controller* returns a UI-representable result to the *View*
///
/// **View** conforms to this protocol
protocol QuotesControllerOutput: class {
    var quotesController: QuotesViewInput? { get set }
    
    func onQuotesRetrieval(quotes: [Quote])
    
}
