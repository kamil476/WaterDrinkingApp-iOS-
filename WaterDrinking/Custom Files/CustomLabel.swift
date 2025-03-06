//
//  CustomLabel.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 10/02/2025.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    init(text: String, textAlignment: NSTextAlignment = .center, textColor: UIColor?, font: UIFont?) {
        super.init(frame: .zero)
        self.text = text
        self.font = font
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
