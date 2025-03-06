//
//  Int+Extension.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 14/02/2025.
//

import Foundation
import UIKit


extension Int{
    var autoSized : CGFloat{
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let diagonalSize = sqrt((screenWidth * screenWidth) + (screenHeight * screenHeight))
        let percentage = CGFloat(self)/987*100 //987 is the diagonal size of iphone xs max
        return diagonalSize * percentage / 100
    }
    var widthRatio: CGFloat {
        let width = UIScreen.main.bounds.width/428.0
        return CGFloat(self)*width
    }
}
