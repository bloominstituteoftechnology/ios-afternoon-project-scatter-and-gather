//
//  ViewController.swift
//  ScatterGather
//
//  Created by Cora Jacobson on 7/23/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isScattered: Bool = true
        
    @IBOutlet weak var logoImageView: UIImageView!
    
    var letterLabels: [UILabel] = []
    
    var currentRotationValues: [CGFloat] = [0, 0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        takeYourPositions()
        isScattered = false
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        switch isScattered {
        case false:
            var newHue: [CGFloat] = []
            var newSaturation: [CGFloat] = []
            var newBrightness: [CGFloat] = []
            for _ in 0...5 {
                newHue.append(CGFloat(Int.random(in: 0...359))/359)
                newSaturation.append(CGFloat(Int.random(in: 75...100))/100)
                newBrightness.append(CGFloat(Int.random(in: 75...100))/100)
            }
            
            let animBlock = {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.logoImageView.alpha = 0
                    for i in 0...5 {
                        self.letterLabels[i].layer.backgroundColor = UIColor(hue: newHue[i], saturation: newSaturation[i], brightness: newBrightness[i], alpha: 1).cgColor
                        self.letterLabels[i].textColor = UIColor(hue: newHue[i], saturation: 0.25, brightness: 1, alpha: 1)
                        self.letterLabels[i].shadowColor = UIColor(hue: newHue[i], saturation: 1, brightness: 0.5, alpha: 1)
                    }
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2) {
                    for label in self.letterLabels {
                        label.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
                        label.center.x = self.view.center.x
                        label.center.y = self.view.center.y - 230
                    }
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.2) {
                    for label in self.letterLabels {
                        let rotationAngle = CGFloat(Int.random(in: 1...20)) / 10
                        label.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi)
                        label.center.x = CGFloat(Int.random(in: 0...Int(self.view.bounds.size.width)))
                        label.center.y = CGFloat(Int.random(in: Int(self.view.bounds.size.height * 0.2)...Int(self.view.bounds.size.height * 0.4)))
                    }
                }
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2) {
                    for label in self.letterLabels {
                        let rotationAngle = CGFloat(Int.random(in: 1...20)) / 10
                        label.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi)
                        label.center.x = CGFloat(Int.random(in: 0...Int(self.view.bounds.size.width)))
                        label.center.y = CGFloat(Int.random(in: Int(self.view.bounds.size.height * 0.4)...Int(self.view.bounds.size.height * 0.6)))
                    }
                }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2) {
                    for label in self.letterLabels {
                        let rotationAngle = CGFloat(Int.random(in: 1...20)) / 10
                        label.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi)
                        label.center.x = CGFloat(Int.random(in: 0...Int(self.view.bounds.size.width)))
                        label.center.y = CGFloat(Int.random(in: Int(self.view.bounds.size.height * 0.6)...Int(self.view.bounds.size.height * 0.8)))
                    }
                }
                UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2) {
                    self.currentRotationValues = []
                    for label in self.letterLabels {
                        let newRotationAngle = (CGFloat(Int.random(in: 1...20)) / 10) * .pi
                        self.currentRotationValues.append(newRotationAngle)
                        label.transform = CGAffineTransform(rotationAngle: newRotationAngle)
                        label.center.x = CGFloat(Int.random(in: 0...Int(self.view.bounds.size.width)))
                        label.center.y = CGFloat(Int.random(in: Int(self.view.bounds.size.height * 0.8)...Int(self.view.bounds.size.height)))
                    }
                }
                
            }
            
            UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: animBlock, completion: nil)
            
            isScattered = true
            
        case true:
            UIView.animate(withDuration: 2) {
                self.logoImageView.alpha = 1
                for label in self.letterLabels {
                    label.layer.backgroundColor = UIColor(hue: 349/359, saturation: 0.90, brightness: 0.73, alpha: 1).cgColor
                    label.textColor = UIColor(hue: 180/359, saturation: 0, brightness: 1, alpha: 1)
                    label.shadowColor = UIColor(hue: 349/359, saturation: 1, brightness: 0.5, alpha: 1)
                }
            }
            self.takeYourPositions()
            isScattered = false
        }
    }
    
    func setUpView() {
        let letters = ["L", "A", "M", "B", "D", "A"]

        for i in 0...5 {
            let label = UILabel(frame: CGRect(x: self.view.center.x, y: 0, width: 55, height: 55))
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 12
            label.text = letters[i]
            label.textAlignment = .center
            label.font = UIFont(name: "Noteworthy-Bold", size: 40)
            label.layer.backgroundColor = UIColor(hue: 349/359, saturation: 0.90, brightness: 0.73, alpha: 1).cgColor
            label.textColor = UIColor(hue: 180/359, saturation: 0, brightness: 1, alpha: 1)
            label.shadowColor = UIColor(hue: 349/359, saturation: 1, brightness: 0.5, alpha: 1)
            label.shadowOffset = CGSize(width: 3, height: 3)
            view.addSubview(label)
            label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
            letterLabels.append(label)
        }
        
        self.logoImageView.alpha = 0
        UIView.animate(withDuration: 2) {
            self.logoImageView.alpha = 1
        }
    }
    
    func takeYourPositions() {
        let xModifier: [CGFloat] = [-150, -90, -30, 30, 90, 150]
        for i in 0...5 {
            let pathAnimation = CAKeyframeAnimation(keyPath: "position")
            let curvedPath = CGMutablePath()
            curvedPath.move(to: CGPoint(x: self.letterLabels[i].frame.origin.x + 27.5, y: self.letterLabels[i].frame.origin.y + 27.5))
            curvedPath.addQuadCurve(to: CGPoint(x: self.view.center.x + xModifier[i], y: self.view.center.y - 200), control: CGPoint(x: self.view.center.x,  y: self.view.center.y - 100))
            pathAnimation.path = curvedPath
            pathAnimation.duration = 2

            let scaleUpAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleUpAnimation.toValue = 1.5
            scaleUpAnimation.duration = 1

            let scaleDownAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleDownAnimation.fromValue = 1.5
            scaleDownAnimation.toValue = 1
            scaleDownAnimation.duration = 1
            scaleDownAnimation.beginTime = 1
            
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotationAnimation.fromValue = currentRotationValues[i]
            rotationAnimation.toValue = 0
            rotationAnimation.duration = 2

            let group = CAAnimationGroup()
            group.animations = [scaleUpAnimation, scaleDownAnimation, rotationAnimation, pathAnimation]
            group.duration = 2
            
            self.letterLabels[i].layer.add(group, forKey: "labelBeingAnimated")
        }
        
        for i in 0...5 {
            self.letterLabels[i].center = CGPoint(x: self.view.center.x + xModifier[i], y: self.view.center.y - 200)
            self.letterLabels[i].transform = .identity
        }
        
    }
    
}

