//
//  AnalyticsCollectionViewCell.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 21/02/2025.
//

import UIKit

class AnalyticsCollectionViewCell: UICollectionViewCell {
    
//    static let identifier = "AnalyticsCollectionViewCell"

    var waterQuantityLabel = UILabel()
    private let waterDrankIcon = CustomImageView(imageName: "")
    private let waterDrankLabel = CustomLabel(text: "", textColor: .gray, font: UIFont.systemFont(ofSize: 11, weight: .bold))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.contentView.backgroundColor = .clear
        contentView.addSubview(waterDrankIcon)
        contentView.addSubview(waterDrankLabel)
        contentView.addSubview(waterQuantityLabel)
        waterQuantityLabel.font = UIFont.systemFont(ofSize: 12)
        waterQuantityLabel.textColor = .gray
        waterQuantityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            waterDrankIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            waterDrankIcon.heightAnchor.constraint(equalToConstant: 32),
            waterDrankIcon.widthAnchor.constraint(equalToConstant: 32),
            waterDrankIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            waterDrankLabel.topAnchor.constraint(equalTo: waterDrankIcon.bottomAnchor, constant: 4),
            waterDrankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            waterDrankLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            
            waterQuantityLabel.topAnchor.constraint(equalTo: waterDrankLabel.bottomAnchor, constant: 4),
            waterQuantityLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    func configure(with item: listOfSavedDrinks) {
        waterDrankIcon.image = UIImage(named: item.drinkImage.lowercased())
        waterDrankLabel.text = item.drinkName
        waterQuantityLabel.text = item.drinkQuantity
    }
}
