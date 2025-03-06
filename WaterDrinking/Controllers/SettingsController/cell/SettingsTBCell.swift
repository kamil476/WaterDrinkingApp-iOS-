//
//  SettingsTBCell.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 17/02/2025.
//

import UIKit

class SettingsTBCell: UITableViewCell {
    
    private let imgView = CustomImageView(imageName: "")
    private let waterGoalLabel = CustomLabel(text: "Daily Water Goal", textColor: .gray, font: UIFont.systemFont(ofSize: 16, weight: .bold))
    private let limitLabel = CustomLabel(text: "", textColor: .lightGray, font: UIFont.systemFont(ofSize: 10, weight: .bold))
    
    
    //    // Add properties for waterGoal and limit
    //     var waterGoal: String? {
    //         didSet {
    //             waterGoalLabel.text = waterGoal
    //         }
    //     }
    //
    //     var limit: String? {
    //         didSet {
    //             limitLabel.text = limit
    //         }
    //     }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private func setupTable(){
        contentView.addSubview(imgView)
        contentView.addSubview(waterGoalLabel)
        contentView.addSubview(limitLabel)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        waterGoalLabel.translatesAutoresizingMaskIntoConstraints = false
        limitLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            
            waterGoalLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            waterGoalLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 6),
            waterGoalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
        ])
    }
    
    func configure(){
        imgView.image = UIImage(named: "water")
        waterGoalLabel.text = "Daily Water Goal"
        limitLabel.text = ""
    }
}
