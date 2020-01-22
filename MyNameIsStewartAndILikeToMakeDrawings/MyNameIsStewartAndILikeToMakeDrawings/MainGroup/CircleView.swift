//
//  CircleView.swift
//  MyNameIsStewartAndILikeToMakeDrawings
//
//  Created by Kenny on 1/22/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

@IBDesignable class CircleView: UIView {
    private let mainColor = UIColor.systemBlue
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let context = UIGraphicsGetCurrentContext() {
            //draw outer circle
            drawEllipse(rect: rect,
                       context: context,
                       fillColor: mainColor)
            //draw inner circle
            let innerEllipseHeightWidth = rect.height/1.3
            let innerOffset = (rect.width - innerEllipseHeightWidth)/2
            
            let innerEllipseRect = CGRect(x: rect.minX + innerOffset,
                                          y: rect.minY + innerOffset,
                                          width: innerEllipseHeightWidth,
                                          height: innerEllipseHeightWidth)
                drawEllipse(rect: innerEllipseRect, context: context, fillColor: .white)
            //draw left eye
            let leftEyeWidth: CGFloat = 30
            let leftEyeHeight: CGFloat = 50
            let leftEyeRect = CGRect(x: rect.midX - leftEyeWidth/1.5, y: rect.midY - leftEyeHeight/2, width: leftEyeWidth, height: leftEyeHeight)
            drawEllipse(rect: leftEyeRect,
                        context: context,
                        fillColor: mainColor)
            //draw right eye
            let rightEyeWidth: CGFloat = 22
            let rightEyeHeight: CGFloat = 32
            let rightEyeRect = CGRect(x: leftEyeRect.midX + leftEyeWidth, y: leftEyeRect.minY + rightEyeHeight/4, width: rightEyeWidth, height: rightEyeHeight)
            drawEllipse(rect: rightEyeRect,
                        context: context,
                        fillColor: mainColor)
            
            //draw top line
            let lineWidth:CGFloat = 30
            let topLineFromPoint:CGPoint = CGPoint(x: rect.midX, y: rect.minY + CGFloat(8))
            let topLineToPoint:CGPoint = CGPoint(x:rect.minX, y:rect.minY)
            drawLine(drawFrom: topLineFromPoint, to: topLineToPoint, context: context, lineWidth: lineWidth, lineColor: mainColor)
            
            
            let curvedLineFromPoint: CGPoint = CGPoint(x: topLineToPoint.x, y: topLineToPoint.y + 8)
            let curvedStartToPoint: CGPoint = CGPoint(x: rect.midX - innerOffset*1.5, y: topLineToPoint.y + lineWidth/1.2)
            drawLine(drawFrom: curvedLineFromPoint, to: curvedStartToPoint, context: context, lineWidth: lineWidth/2, lineColor: mainColor)
            
            #warning("TODO if time permits:")
            //draw first line to end at start point of curved line
            //draw curved portion of line (quadratic curve)
            
            //a possible "hack" instead of the above is drawing a small white circle that intersects with the bottom point of the line and the outer circle's border
            
        }
    }
    
    private func drawEllipse(rect: CGRect, context: CGContext, fillColor: UIColor) {
        context.addEllipse(in: rect) // the rectangle of the UIView is passed into the draw method
        context.setFillColor(fillColor.cgColor)
        context.fillPath()
    }
    
    private func drawLine(drawFrom: CGPoint, to: CGPoint, context: CGContext, lineWidth: CGFloat, lineColor: UIColor) {
        context.setStrokeColor(lineColor.cgColor)
        context.beginPath()
        context.move(to: drawFrom)
        context.setLineWidth(lineWidth)
        context.addLine(to: to)
        context.strokePath()
    }
   

}
