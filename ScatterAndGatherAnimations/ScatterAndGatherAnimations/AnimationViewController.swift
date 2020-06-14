//
//  AnimationViewController.swift
//  ScatterAndGatherAnimations
//
//  Created by Josh Kocsis on 5/22/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var isScattered: Bool = false
    
    var labelXPosition: CGFloat!
    var labelYPosition: CGFloat!
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var aLabel2: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelXPosition = view.safeAreaLayoutGuide.layoutFrame.size.width / 7.0
        labelYPosition = 120
        
        labelStartingPosition()
        
        lLabel.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        aLabel.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        mLabel.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        bLabel.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        dLabel.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        aLabel2.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        
        startingLabelBackgroundColor()
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        if isScattered {
            gather()
        } else {
            scatter()
        }
        isScattered = !isScattered
    }
    
    func scatter () {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.logoImageView.alpha = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                self.lLabel.center = self.randomPosition()
                self.aLabel.center = self.randomPosition()
                self.mLabel.center = self.randomPosition()
                self.bLabel.center = self.randomPosition()
                self.dLabel.center = self.randomPosition()
                self.aLabel2.center = self.randomPosition()
                
                self.lLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                self.aLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                self.mLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                self.bLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                self.dLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
                self.aLabel2.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            }
        }, completion: nil)
        
        labelRandomColor(label: lLabel)
        labelRandomColor(label: aLabel)
        labelRandomColor(label: mLabel)
        labelRandomColor(label: bLabel)
        labelRandomColor(label: dLabel)
        labelRandomColor(label: aLabel2)
        
        labelRandomBackgroundColor(label: lLabel)
        labelRandomBackgroundColor(label: aLabel)
        labelRandomBackgroundColor(label: mLabel)
        labelRandomBackgroundColor(label: bLabel)
        labelRandomBackgroundColor(label: dLabel)
        labelRandomBackgroundColor(label: aLabel2)
        
    }
    
    func gather() {
        UIView.animate(withDuration: 0.8) {
            self.logoImageView.alpha = 1
        }
        
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut], animations: {
            self.labelStartingPosition()
            
            self.lLabel.transform = .identity
            self.aLabel.transform = .identity
            self.mLabel.transform = .identity
            self.bLabel.transform = .identity
            self.dLabel.transform = .identity
            self.aLabel2.transform = .identity
            
            self.startingLabelColor(label: self.lLabel)
            self.startingLabelColor(label: self.aLabel)
            self.startingLabelColor(label: self.mLabel)
            self.startingLabelColor(label: self.bLabel)
            self.startingLabelColor(label: self.dLabel)
            self.startingLabelColor(label: self.aLabel2)
            
            self.startingLabelBackgroundColor()
            
        }, completion: nil)
    }
    
    func randomPosition() -> CGPoint {
        let width = view.safeAreaLayoutGuide.layoutFrame.size.width
        let height = view.safeAreaLayoutGuide.layoutFrame.size.height
        let randomXPosition = CGFloat.random(in: 40...width-40)
        let randomYPosition = CGFloat.random(in: 40...height-40)
        
        return CGPoint(x: randomXPosition, y: randomYPosition)
    }
    
    func labelStartingPosition() {
        lLabel.center = CGPoint(x: labelXPosition, y: labelYPosition)
        aLabel.center = CGPoint(x: lLabel.center.x + labelXPosition, y: labelYPosition)
        mLabel.center = CGPoint(x: aLabel.center.x + labelXPosition, y: labelYPosition)
        bLabel.center = CGPoint(x: mLabel.center.x + labelXPosition, y: labelYPosition)
        dLabel.center = CGPoint(x: bLabel.center.x + labelXPosition, y: labelYPosition)
        aLabel2.center = CGPoint(x: dLabel.center.x + labelXPosition, y: labelYPosition)
    }
    
    func randomAngle() -> CGFloat {
        return CGFloat.random(in: -CGFloat.pi * 2 ... CGFloat.pi * 2)
    }
    
    func randomColor() -> CGColor {
        let red = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0).cgColor
    }
    
    func randomBacgroundColor(label: UILabel) {
        let animationColor = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        animationColor.fromValue = label.layer.backgroundColor
        
        let color = randomColor()
        
        label.layer.backgroundColor = color
        animationColor.toValue = color
        
        animationColor.duration = 2
        animationColor.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        label.layer.add(animationColor, forKey: "backgroundColor")
    }
    
    func labelRandomColor(label: UILabel) {
        label.layer.borderWidth = 3
        
        let animationColor = CABasicAnimation(keyPath: #keyPath(CALayer.borderColor))
        animationColor.fromValue = label.layer.borderColor
        
        let color = randomColor()
        
        label.layer.borderColor = color
        animationColor.toValue = color
        
        animationColor.duration = 2
        animationColor.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        label.layer.add(animationColor, forKey: "borderColorAnimation")
    }
    
    func labelRandomBackgroundColor(label: UILabel) {
        let animationColor = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        animationColor.fromValue = label.layer.backgroundColor
        
        let color = randomColor()
        
        label.layer.backgroundColor = color
        animationColor.toValue = color
        
        animationColor.duration = 2
        animationColor.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        label.layer.add(animationColor, forKey: "backgroundColor")
    }
    
    func startingLabelColor(label: UILabel) {
        let animationColor = CABasicAnimation(keyPath: #keyPath(CALayer.borderColor))
        animationColor.fromValue = label.layer.borderColor
        
        let color = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        
        label.layer.borderColor = color
        animationColor.toValue = color
        
        animationColor.duration = 2
        animationColor.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        label.layer.add(animationColor, forKey: "borderColorAnimation")
    }
    
    func startingLabelBackgroundColor() {
        lLabel.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        aLabel.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        mLabel.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        bLabel.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        dLabel.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
        aLabel2.layer.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0)
    }
    
}
