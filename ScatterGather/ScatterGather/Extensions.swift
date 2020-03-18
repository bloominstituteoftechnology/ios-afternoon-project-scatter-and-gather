//
//  Extensions.swift
//  ScatterGather
//
//  Created by Shawn Gee on 3/17/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = text
    }
}

extension CGColor {
    static var random: CGColor {
        .init(srgbRed: .random(in: 0...1), green: .random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    }
}
