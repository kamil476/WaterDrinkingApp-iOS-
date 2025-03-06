//
//  CustomButton.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 10/02/2025.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // passing bgcolor and title
    init(backgroundColor: UIColor, title: String){
        // For Autolayout constraints height, width thats why zero
        super.init(frame: .zero)
        // setting the bg color and title
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        // sets up corner radius, font, color
        configure()
    }
    private func configure(){
        layer.cornerRadius = 10
        //        titleLabel?.textColor = .white
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        //AutoLayout purpose
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
