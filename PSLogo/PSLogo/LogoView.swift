//
//  LogoView.swift
//  PSLogo
//
//  Created by Ufuk Türközü on 22.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

struct Logo {
    let cornerRadius: CGFloat
    let color: UIColor
}

@IBDesignable class LogoView: UIView {
    
    var blackCircle = Logo(cornerRadius: 100 , color: .black)
    var whiteCircle = Logo(cornerRadius: 100 , color: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        
        let firstOPosition = CGPoint(x: rect.size.width / 8,
                       y: rect.size.height / 130)
         
        let secondOPosition = CGPoint(x: rect.size.width / 8,
                       y: rect.size.height / 1)
         
        let thirdOPosition = CGPoint(x: rect.size.width / 2.75,
                       y: rect.size.height / 2.0)
         
        let fourthOPosition = CGPoint(x: rect.size.width / 1.67,
                       y: rect.size.height / 130)
         
        let fifthOPosition = CGPoint(x: rect.size.width / 1.67,
                       y: rect.size.height / 1)
         
        let sixthOPosition = CGPoint(x: rect.size.width / 1.20,
                       y: rect.size.height / 2.0)
        
        
        
        
        if let context = UIGraphicsGetCurrentContext() {
            
            // 1 Circle
            let firstBlackCircleRadius: CGFloat = 50
            let firstBlackCircleRect = CGRect(x: firstOPosition.x - firstBlackCircleRadius, y: firstOPosition.y - firstBlackCircleRadius, width: 2 * firstBlackCircleRadius, height: 2 * firstBlackCircleRadius )
            context.addEllipse(in: firstBlackCircleRect)
            context.setFillColor(blackCircle.color.cgColor)
            context.fillPath()
            
            let firstWhiteCircleRadius: CGFloat = 20
            let firstWhiteCircleRect = CGRect(x: firstOPosition.x - firstWhiteCircleRadius, y: firstOPosition.y - firstWhiteCircleRadius, width: 2 * firstWhiteCircleRadius, height: 2 * firstWhiteCircleRadius )
            context.addEllipse(in: firstWhiteCircleRect)
            context.setFillColor(whiteCircle.color.cgColor)
            context.fillPath()
            
            // 2 Circle
            let secondBlackCircleRadius: CGFloat = 50
            let secondBlackCircleRect = CGRect(x: secondOPosition.x - secondBlackCircleRadius, y: secondOPosition.y - secondBlackCircleRadius, width: 2 * secondBlackCircleRadius, height: 2 * secondBlackCircleRadius )
            context.addEllipse(in: secondBlackCircleRect)
            context.setFillColor(blackCircle.color.cgColor)
            context.fillPath()
            
            let secondWhiteCircleRadius: CGFloat = 20
            let secondWhiteCircleRect = CGRect(x: secondOPosition.x - secondWhiteCircleRadius, y: secondOPosition.y - secondWhiteCircleRadius, width: 2 * secondWhiteCircleRadius, height: 2 * secondWhiteCircleRadius )
            context.addEllipse(in: secondWhiteCircleRect)
            context.setFillColor(whiteCircle.color.cgColor)
            context.fillPath()
            
            // 3 Black Circle
            let thirdBlackCircleRadius: CGFloat = 50
            let thirdBlackCircleRect = CGRect(x: thirdOPosition.x - thirdBlackCircleRadius, y: thirdOPosition.y - thirdBlackCircleRadius, width: 2 * thirdBlackCircleRadius, height: 2 * thirdBlackCircleRadius )
            context.addEllipse(in: thirdBlackCircleRect)
            context.setFillColor(blackCircle.color.cgColor)
            context.fillPath()
            
            let thirdWhiteCircleRadius: CGFloat = 20
            let thirdWhiteCircleRect = CGRect(x: thirdOPosition.x - thirdWhiteCircleRadius, y: thirdOPosition.y - thirdWhiteCircleRadius, width: 2 * thirdWhiteCircleRadius, height: 2 * thirdWhiteCircleRadius )
            context.addEllipse(in: thirdWhiteCircleRect)
            context.setFillColor(whiteCircle.color.cgColor)
            context.fillPath()
            
            // 4 Circle
            let fourthBlackCircleRadius: CGFloat = 50
            let fourthBlackCircleRect = CGRect(x: fourthOPosition.x - fourthBlackCircleRadius, y: fourthOPosition.y - fourthBlackCircleRadius, width: 2 * fourthBlackCircleRadius, height: 2 * fourthBlackCircleRadius )
            context.addEllipse(in: fourthBlackCircleRect)
            context.setFillColor(blackCircle.color.cgColor)
            context.fillPath()
            
            let fourthWhiteCircleRadius: CGFloat = 20
            let fourthWhiteCircleRect = CGRect(x: fourthOPosition.x - fourthWhiteCircleRadius, y: fourthOPosition.y - fourthWhiteCircleRadius, width: 2 * fourthWhiteCircleRadius, height: 2 * fourthWhiteCircleRadius )
            context.addEllipse(in: fourthWhiteCircleRect)
            context.setFillColor(whiteCircle.color.cgColor)
            context.fillPath()
            
            // 5 Circle
            let fifthBlackCircleRadius: CGFloat = 50
            let fifthBlackCircleRect = CGRect(x: fifthOPosition.x - fifthBlackCircleRadius, y: fifthOPosition.y - fifthBlackCircleRadius, width: 2 * fifthBlackCircleRadius, height: 2 * fifthBlackCircleRadius )
            context.addEllipse(in: fifthBlackCircleRect)
            context.setFillColor(blackCircle.color.cgColor)
            context.fillPath()
            
            let fifthWhiteCircleRadius: CGFloat = 20
            let fifthWhiteCircleRect = CGRect(x: fifthOPosition.x - fifthWhiteCircleRadius, y: fifthOPosition.y - fifthWhiteCircleRadius, width: 2 * fifthWhiteCircleRadius, height: 2 * fifthWhiteCircleRadius )
            context.addEllipse(in: fifthWhiteCircleRect)
            context.setFillColor(whiteCircle.color.cgColor)
            context.fillPath()
            
            // 6 Black Circle
            let sixthBlackCircleRadius: CGFloat = 50
            let sixthBlackCircleRect = CGRect(x: sixthOPosition.x - sixthBlackCircleRadius, y: sixthOPosition.y - sixthBlackCircleRadius, width: 2 * sixthBlackCircleRadius, height: 2 * sixthBlackCircleRadius )
            context.addEllipse(in: sixthBlackCircleRect)
            context.setFillColor(blackCircle.color.cgColor)
            context.fillPath()
            
            let sixthWhiteCircleRadius: CGFloat = 20
            let sixthWhiteCircleRect = CGRect(x: sixthOPosition.x - sixthWhiteCircleRadius, y: sixthOPosition.y - sixthWhiteCircleRadius, width: 2 * sixthWhiteCircleRadius, height: 2 * sixthWhiteCircleRadius )
            context.addEllipse(in: sixthWhiteCircleRect)
            context.setFillColor(whiteCircle.color.cgColor)
            context.fillPath()
            
            
            
            
        }
        
        
    }

}
