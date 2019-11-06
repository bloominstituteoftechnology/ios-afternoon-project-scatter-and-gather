//
//  Color.swift
//  Scatter and Gather
//
//  Created by Jon Bash on 2019-11-05.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

extension CGColor {
    static func random() -> CGColor {
        return CGColor(
            srgbRed: CGFloat.random(in: 0...1.0),
            green: CGFloat.random(in: 0...1.0),
            blue: CGFloat.random(in: 0...1.0),
            alpha: 1.0
        )
    }
}
