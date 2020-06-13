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
    
    override func layoutSubviews() {
        let vc = quotesController as! QuotesViewController
        
        vc.navigationItem.rightBarButtonItem = barButtonItem
        
        quotesController?.onViewLayout()
    }
    
    // MARK: - Properties
    var quotesController: QuotesViewInput?
    private var quotes = [Quote]()
    
    private let quoteCellID = "quoteCellID"
    
    lazy var barButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(chooseUser))
        
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        cv.showsVerticalScrollIndicator = false
        
        cv.register(QuoteCell.self, forCellWithReuseIdentifier: quoteCellID)
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    lazy var placeholder: UIStackView = {
        let label = UILabel()
        label.text = "No quotes to display..."
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Find by username", for: .normal)

        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(chooseUser), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let sv = UIStackView(arrangedSubviews: [label, button])
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 180)
        ])
        
        return sv
    }()
    
    // MARK: - Actions
    @objc private func chooseUser() {
        print("Choose user")
    }
    
}


// MARK: - Controller Output
extension QuotesView: QuotesControllerOutput {
    
    func onQuotesRetrieval(quotes: [Quote]) {
        self.quotes = quotes
        self.placeholder.isHidden = self.quotes.count > 0
        self.collectionView.reloadData()
    }
    
}


// MARK: - CollectionView Delegate & DataSource
extension QuotesView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.quotes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: quoteCellID, for: indexPath) as! QuoteCell
        cell.quote = self.quotes[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.collectionView.frame.width - 20, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}


// MARK: - UI Setup
extension QuotesView {
    
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.backgroundColor = .white
        
        self.addSubview(collectionView)
        self.addSubview(placeholder)
        
        NSLayoutConstraint.activate([
            placeholder.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -50),
            placeholder.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            placeholder.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
