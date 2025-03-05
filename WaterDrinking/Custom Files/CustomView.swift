//
//  CustomView.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 10/02/2025.
//

import UIKit

class CustomView: UIView {
    
    init(backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 0) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
