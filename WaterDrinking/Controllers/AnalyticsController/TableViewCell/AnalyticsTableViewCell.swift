//
//  AnalyticsTableViewCell.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 24/02/2025.
//

import UIKit

class AnalyticsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var drinks: [listOfSavedDrinks] = []
    var dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        dateLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        dateLabel.textColor = .black
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dateLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AnalyticsCollectionViewCell.self, forCellWithReuseIdentifier: "AnalyticsCollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func configure(with date: String, drinks: [listOfSavedDrinks]) {
        self.dateLabel.text = date
        self.drinks = drinks
        collectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnalyticsCollectionViewCell", for: indexPath) as! AnalyticsCollectionViewCell
        let item = drinks[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}
