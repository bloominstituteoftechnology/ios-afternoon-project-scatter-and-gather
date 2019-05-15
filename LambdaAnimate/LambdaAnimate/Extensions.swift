//
//  Extensions.swift
//  LambdaAnimate
//
//  Created by Jeffrey Carpenter on 5/15/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor { return UIColor(red: CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1) }
}

extension CGFloat {
    static var randomAngle: CGFloat { return CGFloat.random(in: 0...360) * CGFloat.pi / 180 }
}

extension CGPoint {
    static func random(inX: ClosedRange<Int>, inY: ClosedRange<Int>) -> CGPoint {
        return CGPoint(x: Int.random(in: inX), y: Int.random(in: inY))
    }
}
