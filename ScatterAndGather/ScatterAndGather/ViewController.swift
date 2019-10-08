//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Gi Pyo Kim on 10/8/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isScattered = false
    
    var labelXFactor: CGFloat!
    var labelYPosition: CGFloat!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var lambdaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelXFactor = view.safeAreaLayoutGuide.layoutFrame.size.width / 7.0
        labelYPosition = 120
        
        setLabelStartingPosition()
        
        label1.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        label2.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        label3.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        label4.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        label5.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        label6.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        
        setLabalStartingBackgroundColor()
    }


    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        if isScattered {
            gather()
        } else {
            scatter()
        }
        isScattered = !isScattered
    }
    
    func scatter() {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.lambdaImageView.alpha = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.label1.center = self.getRandomPositionXY()
                self.label2.center = self.getRandomPositionXY()
                self.label3.center = self.getRandomPositionXY()
                self.label4.center = self.getRandomPositionXY()
                self.label5.center = self.getRandomPositionXY()
                self.label6.center = self.getRandomPositionXY()
                
                self.label1.transform = CGAffineTransform(rotationAngle: self.getRandomAngle())
                self.label2.transform = CGAffineTransform(rotationAngle: self.getRandomAngle())
                self.label3.transform = CGAffineTransform(rotationAngle: self.getRandomAngle())
                self.label4.transform = CGAffineTransform(rotationAngle: self.getRandomAngle())
                self.label5.transform = CGAffineTransform(rotationAngle: self.getRandomAngle())
                self.label6.transform = CGAffineTransform(rotationAngle: self.getRandomAngle())
                
            }
        }, completion: nil)
        
        setLabelRandomColor(label: label1)
        setLabelRandomColor(label: label2)
        setLabelRandomColor(label: label3)
        setLabelRandomColor(label: label4)
        setLabelRandomColor(label: label5)
        setLabelRandomColor(label: label6)
        
        setLabelRandomBackgroundColor(label: label1)
        setLabelRandomBackgroundColor(label: label2)
        setLabelRandomBackgroundColor(label: label3)
        setLabelRandomBackgroundColor(label: label4)
        setLabelRandomBackgroundColor(label: label5)
        setLabelRandomBackgroundColor(label: label6)
        
    }
    
    func gather() {
        UIView.animate(withDuration: 0.8) {
            self.lambdaImageView.alpha = 1
        }
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut], animations: {
            self.setLabelStartingPosition()
            
            self.label1.transform = .identity
            self.label2.transform = .identity
            self.label3.transform = .identity
            self.label4.transform = .identity
            self.label5.transform = .identity
            self.label6.transform = .identity
            
            self.setLabelStartingColor(label: self.label1)
            self.setLabelStartingColor(label: self.label2)
            self.setLabelStartingColor(label: self.label3)
            self.setLabelStartingColor(label: self.label4)
            self.setLabelStartingColor(label: self.label5)
            self.setLabelStartingColor(label: self.label6)
            
            self.setLabalStartingBackgroundColor()
        }, completion: nil)
    }
    
    func getRandomPositionXY() -> CGPoint{
        let maxWidth = view.safeAreaLayoutGuide.layoutFrame.size.width
        let maxHeight = view.safeAreaLayoutGuide.layoutFrame.size.height
        
        let randomX = CGFloat.random(in: 30 ... maxWidth-30)
        let randomY = CGFloat.random(in: 120 ... maxHeight-30)

        return CGPoint(x: randomX, y: randomY)
    }
    
    func getRandomAngle() -> CGFloat {
        return CGFloat.random(in: -CGFloat.pi*2 ... CGFloat.pi*2)
    }
    
    func getRandomColor() -> CGColor {
        let red = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0).cgColor
    }
    
    func setLabelStartingPosition() {
        label1.center = CGPoint(x: labelXFactor, y: labelYPosition)
        label2.center = CGPoint(x: label1.center.x + labelXFactor, y: labelYPosition)
        label3.center = CGPoint(x: label2.center.x + labelXFactor, y: labelYPosition)
        label4.center = CGPoint(x: label3.center.x + labelXFactor, y: labelYPosition)
        label5.center = CGPoint(x: label4.center.x + labelXFactor, y: labelYPosition)
        label6.center = CGPoint(x: label5.center.x + labelXFactor, y: labelYPosition)
    }
    
    func setLabelRandomColor(label: UILabel) {
        label.layer.borderWidth = 3
        
        let colorAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.borderColor))
        colorAnimation.fromValue = label.layer.borderColor
        
        let color = getRandomColor()
        
        label.layer.borderColor = color
        colorAnimation.toValue = color
        
        colorAnimation.duration = 2
        colorAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        label.layer.add(colorAnimation, forKey: "borderColorAnimation")
    }
    
    func setLabelRandomBackgroundColor(label: UILabel) {
        let colorAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        colorAnimation.fromValue = label.layer.backgroundColor
        
        let color = getRandomColor()
        
        label.layer.backgroundColor = color
        colorAnimation.toValue = color
        
        colorAnimation.duration = 2
        colorAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        label.layer.add(colorAnimation, forKey: "backgroundColor")
    }
    
    func setLabelStartingColor(label: UILabel) {
        
        let colorAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.borderColor))
        colorAnimation.fromValue = label.layer.borderColor
        
        let color = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        
        label.layer.borderColor = color
        colorAnimation.toValue = color
        
        colorAnimation.duration = 2
        colorAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        label.layer.add(colorAnimation, forKey: "borderColorAnimation")
    }
    
    func setLabalStartingBackgroundColor() {
        label1.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        label2.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        label3.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        label4.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        label5.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        label6.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
    }
    
}

