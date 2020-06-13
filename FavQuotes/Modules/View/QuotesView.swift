//
//  QuotesView.swift
//  FavQuotes
//
//  Created by kaww on 13/06/2020.
//  Copyright © 2020 Kaww. All rights reserved.
//

import UIKit


class QuotesView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    var quotesController: QuotesViewInput?
    private var quotes = [Quote]()
    
    // MARK: - Actions
    
}


// MARK: - Controller Output
extension QuotesView: QuotesControllerOutput {
    func onQuotesRetrieval(task: [Quote]) {}
    
}


// MARK: - UI Setup
extension QuotesView {
    
    private func setupUI() {
        self.backgroundColor = .white
    }
    
}
