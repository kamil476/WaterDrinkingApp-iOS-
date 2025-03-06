//
//  WaterIntakeCell.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 14/02/2025.
//

import UIKit

class WaterIntakeCell: UICollectionViewCell {
    
    static let identifier = "WaterIntakeCell"
    var waterQuantityFromAddDrink: String = ""
    var waterQuantityLabel = UILabel()
    private let waterDrankIcon = CustomImageView(imageName: "")
    private let waterDrankLabel = CustomLabel(text: "", textColor: .gray, font: UIFont.systemFont(ofSize: 11, weight: .bold))
    //    private let quantityBackView: CustomView = {
    //        let view = CustomView(backgroundColor: .white, cornerRadius: 12)
    //        view.layer.shadowColor = UIColor.black.cgColor
    //        view.layer.shadowOpacity = 0.1
    //        view.layer.shadowOffset = CGSize(width: 1, height: 1)
    //        view.layer.shadowRadius = 6
    //        return view
    //    }()
    
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
        //        contentView.addSubview(quantityBackView)
        contentView.addSubview(waterQuantityLabel)
        waterQuantityLabel.font = UIFont.systemFont(ofSize: 12)
        waterQuantityLabel.textColor = .gray
        waterQuantityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            waterDrankIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 34),
            waterDrankIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
            waterDrankIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
            waterDrankIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21),
            
            waterDrankLabel.topAnchor.constraint(equalTo: waterDrankIcon.bottomAnchor, constant: 4),
            waterDrankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            waterDrankLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            waterQuantityLabel.topAnchor.constraint(equalTo: waterDrankLabel.bottomAnchor, constant: 4),
            //            waterQuantityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 42),
            //            waterQuantityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            waterQuantityLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            //            quantityBackView.topAnchor.constraint(equalTo: waterDrankLabel.bottomAnchor, constant: 4),
            //            quantityBackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            //            quantityBackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            //            quantityBackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
        ])
    }
    
    func configure(with item: listOfDrinks) {
        waterDrankIcon.image = UIImage(named: item.drinkImage)
        waterDrankLabel.text = item.drinkName
        waterQuantityLabel.text = item.drinkQuantity
    }
}
