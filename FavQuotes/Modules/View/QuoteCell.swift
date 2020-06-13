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
            quoteLabel.text = "❝ \(quote.body) ❞"
            authorLabel.text = " ✒️ \(quote.author)"
            favoritesLabel.text = "\(quote.favorites_count) ⭐️"
            let tags = (quote.tags.map { String($0) }).joined(separator: ", ")
            tagsLabel.text = tags.isEmpty ? "" : "tags: \(tags)"
        }
    }
    
    lazy var quoteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        label.text = ""
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var favoritesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.text = ""
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var tagsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textColor = .white
        label.text = ""
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Action
    
}


// MARK: - UI Setup
extension QuoteCell {
    
    private func setupUI() {
        let lightColor = UIColor.init(red: 66 / 255, green: 157 / 255, blue: 255 / 255, alpha: 1)
        self.addGradientWithCornerRadius(startColor: lightColor, endColor: .systemBlue, radius: 10)
        self.layer.cornerRadius = 10
        
        self.addSubview(quoteLabel)
        self.addSubview(tagsLabel)
        
        let stackview = UIStackView(arrangedSubviews: [authorLabel, favoritesLabel])
        stackview.axis = .horizontal
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fillProportionally
        
        self.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            quoteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            quoteLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40),
            
            tagsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tagsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40),
            tagsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            stackview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            stackview.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40),
            stackview.bottomAnchor.constraint(equalTo: tagsLabel.topAnchor, constant: -10)
        ])
    }
    
}
