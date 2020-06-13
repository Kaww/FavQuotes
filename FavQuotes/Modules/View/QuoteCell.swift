//
//  QuoteCell.swift
//  FavQuotes
//
//  Created by kaww on 13/06/2020.
//  Copyright © 2020 Kaww. All rights reserved.
//

import UIKit


class QuoteCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Properties
    var quote: Quote! {
        didSet {
            quoteLabel.text = quote.body
        }
    }
    
    lazy var quoteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        label.text = ""
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Action
    
}


// MARK: - UI Setup
extension QuoteCell {
    
    private func setupUI() {
        self.backgroundColor = .systemBlue
        self.layer.cornerRadius = 10
        
        self.addSubview(quoteLabel)
        
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            quoteLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            quoteLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40),
        ])
    }
    
}
