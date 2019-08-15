//
//  UIColor+Random.swift
//  Scatter and Gather
//
//  Created by Jake Connerly on 8/14/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        let red = CGFloat.random(in: 0...255) / 255
        let green = CGFloat.random(in: 0...255) / 255
        let blue = CGFloat.random(in: 0...255) / 255
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
