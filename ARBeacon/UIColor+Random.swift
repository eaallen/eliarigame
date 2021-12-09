//
//  UIColor+Random.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/4/21.
//

import Foundation
import UIKit

extension UIColor {
    class func randomColor()->UIColor{
        let colors: [UIColor] = [.white, .red, .blue, .yellow, .cyan, .orange, .green, .black, .brown, .darkGray, .lightGray]
        return colors.randomElement() ?? .white
    }
}
