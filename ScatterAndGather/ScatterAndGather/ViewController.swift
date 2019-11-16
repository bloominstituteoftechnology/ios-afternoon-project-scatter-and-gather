//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by denis cedeno on 11/16/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var secondALabel: UILabel!
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    
    var isScattered: Bool = false
    var lOriginPoint: CGPoint!
    var aOriginPoint: CGPoint!
    var mOriginPoint: CGPoint!
    var bOriginPoint: CGPoint!
    var dOriginPoint: CGPoint!
    var aaOriginPoint: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originLocations()
    }
    
    private func originLocations() {
        if !isScattered{
            lOriginPoint = lLabel.center
            aOriginPoint = aLabel.center
            mOriginPoint = mLabel.center
            bOriginPoint = bLabel.center
            dOriginPoint = dLabel.center
            aaOriginPoint = secondALabel.center
        }
    }
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered == true {
            gather()
        } else {
            scatter()
        }
        isScattered.toggle()
    }
    
    func gather() {
        UIView.animate(withDuration: 3.0) {
            self.lambdaLogoImageView.alpha = 1.0
            
            self.resetToOrigin(letter: self.lLabel)
            self.lLabel.center = self.lOriginPoint
            
            self.resetToOrigin(letter: self.aLabel)
            self.aLabel.center = self.aOriginPoint
            
            self.resetToOrigin(letter: self.mLabel)
            self.mLabel.center = self.mOriginPoint
            
            self.resetToOrigin(letter: self.bLabel)
            self.bLabel.center = self.bOriginPoint
            
            self.resetToOrigin(letter: self.dLabel)
            self.dLabel.center = self.dOriginPoint
            
            self.resetToOrigin(letter: self.secondALabel)
            self.secondALabel.center = self.aaOriginPoint
            
        }
    }
    
    func resetToOrigin(letter: UILabel) {
        letter.transform = .identity
        letter.textColor = .black
        letter.layer.backgroundColor = CGColor(srgbRed: 100, green: 100, blue: 100, alpha: 1)
        letter.alpha = 1.0
    }
    
    func randomness(letter: UILabel) {
        let randomX = Int.random(in: 0...Int(view.bounds.size.width - letter.frame.size.width))
        let randomY = Int.random(in: 0...Int(view.bounds.size.height - letter.frame.size.height ))
        letter.center = CGPoint(x: randomX, y: randomY)
        
        let textColor = UIColor(displayP3Red: CGFloat(Int.random(in: 0...100))/100, green: CGFloat(Int.random(in: 0...100))/100, blue: CGFloat(Int.random(in: 0...100))/100, alpha: 1)
        letter.textColor = textColor
        
        let backgroundColor = CGColor(srgbRed: CGFloat(Int.random(in: 0...100))/100, green: CGFloat(Int.random(in: 0...100))/100, blue: CGFloat(Int.random(in: 0...100))/100, alpha: 1)
        letter.layer.backgroundColor = backgroundColor
        
        letter.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 0...360)))
        
        letter.alpha = 0.5
    }
    
    
    func scatter() {
        UIView.animate(withDuration: 3.0) {
            self.lambdaLogoImageView.alpha = 0.0
            
            let animationBlock = {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8) {
                    self.randomness(letter: self.lLabel)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.3) {
                    self.randomness(letter: self.aLabel)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.5) {
                    self.randomness(letter: self.mLabel)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2) {
                    self.randomness(letter: self.bLabel)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.7) {
                    self.randomness(letter: self.dLabel)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.6) {
                    self.randomness(letter: self.secondALabel)
                }
            }
            
            UIView.animateKeyframes(withDuration: 0.5, delay: 0.5, options: [], animations: animationBlock, completion: nil)
        }
    }
}

