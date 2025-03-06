//
//  ColorExtension.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 03/03/2025.
//

import Foundation
import UIKit


// MARK: - EXTENSION BACKGROUND COLOR
extension UIColor {
    @nonobjc class var backGroundBlue: UIColor {
        let color = UIColor(red: 224 / 255.0, green: 240 / 255.0, blue: 252 / 255.0, alpha: 1.0)
        return color
    }
    
    @nonobjc class var customBlue: UIColor {
        let color = UIColor(red: 101 / 255.0, green: 116 / 255.0, blue: 199 / 255.0, alpha: 1.0)
        return color
    }
    
    @nonobjc class var blueText: UIColor {
        let color = UIColor(red: 31 / 255.0, green: 106 / 255.0, blue: 191 / 255.0, alpha: 1.0)
        return color
    }
}
