//
//  OnboardingCell.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 11/02/2025.
//

import UIKit


class OnboardingCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    let osIcon = CustomImageView(imageName: "")
    let osLabelOne = CustomLabel(text: "", textColor: .black, font: UIFont.systemFont(ofSize: 26, weight: .bold))
    let osLabelTwo = CustomLabel(text: "", textColor: .systemGray, font: UIFont.systemFont(ofSize: 15, weight: .light))
    //    let nextButton = CustomButton(backgroundColor: UIColor(hex: "#5DCCFC"), title: "Next")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.contentView.backgroundColor = .systemBackground
        contentView.addSubview(osIcon)
        contentView.addSubview(osLabelOne)
        contentView.addSubview(osLabelTwo)
        //        contentView.addSubview(nextButton)
        
        
        // Setup constraints for the views (same as in the onboarding screen code)
        osIcon.translatesAutoresizingMaskIntoConstraints = false
        osLabelOne.translatesAutoresizingMaskIntoConstraints = false
        osLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        //       nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            osIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            osIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 170),
            
            osLabelOne.topAnchor.constraint(equalTo: osIcon.bottomAnchor, constant: 20),
            osLabelOne.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            osLabelOne.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            
            osLabelTwo.topAnchor.constraint(equalTo: osLabelOne.bottomAnchor, constant: 20),
            osLabelTwo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            osLabelTwo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
        ])
    }
    
    func configure(with item: OnboardingItem) {
        osIcon.image = UIImage(named: item.imageName)
        osLabelOne.text = item.title
        osLabelTwo.text = item.subtitle
        //        nextButton.setTitle(item.buttonTitle, for: .normal)
    }
}



