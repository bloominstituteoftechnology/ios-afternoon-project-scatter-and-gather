//
//  ViewController.swift
//  ScatterandGather
//
//  Created by Thomas Sabino-Benowitz on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class lambdaViewController: UIViewController {
    var isScattered: Bool = false
   
    var random_angle1 = CGFloat(Int.random(in: -360...360))
    var random_angle2 = CGFloat(Int.random(in: -360...360))
    var random_angle3 = CGFloat(Int.random(in: -360...360))
    var random_angle4 = CGFloat(Int.random(in: -360...360))
    var random_angle5 = CGFloat(Int.random(in: -360...360))
    var random_angle6 = CGFloat(Int.random(in: -360...360))
    
    @IBOutlet weak var a2Label: UILabel!
    
    @IBOutlet weak var dLabel: UILabel!
    
    @IBOutlet weak var bLabel: UILabel!
    
    @IBOutlet weak var mLabel: UILabel!
    
    @IBOutlet weak var a1Label: UILabel!
    
    @IBOutlet weak var lLabel: UILabel!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    var a1Origin: CGPoint!
    var a2Origin: CGPoint!
    var dOrigin: CGPoint!
    var bOrigin: CGPoint!
    var mOrigin: CGPoint!
    var lOrigin: CGPoint!

// MARK: +View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOrigins()
        
    }
    
    private func setOrigins() {
        a1Origin = a1Label.center
        a2Origin = a2Label.center
        dOrigin = dLabel.center
        bOrigin = bLabel.center
        mOrigin = mLabel.center
        lOrigin = lLabel.center
    }
   
//    MARK: +Animation functions
    
    func scatterAnimation(){
        UIView.animate(withDuration: 2) {
            self.logoImageView.alpha = 0
            
            self.a1Label.backgroundColor = .random
            self.a2Label.backgroundColor = .random
            self.dLabel.backgroundColor = .random
            self.bLabel.backgroundColor = .random
            self.mLabel.backgroundColor = .random
            self.lLabel.backgroundColor = .random
            
            self.lLabel.textColor = .random
            self.a1Label.textColor = .random
            self.mLabel.textColor = .random
            self.bLabel.textColor = .random
            self.dLabel.textColor = .random
            self.a2Label.textColor = .random
            
            self.lLabel.transform = CGAffineTransform(rotationAngle: self.random_angle1)
            self.a1Label.transform = CGAffineTransform(rotationAngle: self.random_angle2)
            self.mLabel.transform = CGAffineTransform(rotationAngle: self.random_angle3)
            self.bLabel.transform = CGAffineTransform(rotationAngle: self.random_angle4)
            self.dLabel.transform = CGAffineTransform(rotationAngle: self.random_angle5)
            self.a2Label.transform = CGAffineTransform(rotationAngle: self.random_angle6)
            
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.a1Label.center = CGPoint(x: .random(in: 0...350), y: .random(in: -140...600))
                    self.a2Label.center = CGPoint(x: .random(in: 0...350), y: .random(in: -140...600))
                    self.lLabel.center = CGPoint(x: .random(in: 150...350), y: .random(in: -140...600))
                    self.mLabel.center = CGPoint(x: .random(in: 0...350), y: .random(in: -140...600))
                    self.bLabel.center = CGPoint(x: .random(in: 0...350), y: .random(in: -140...600))
                    self.dLabel.center = CGPoint(x: .random(in: 0...350), y: .random(in: -140...600))
                }
            }, completion: nil)
            
            self.view.backgroundColor = .random
        }
        lLabel.layer.borderWidth = 0
        a1Label.layer.borderWidth = 0
        mLabel.layer.borderWidth = 0
        bLabel.layer.borderWidth = 0
        dLabel.layer.borderWidth = 0
        a2Label.layer.borderWidth = 0
        
        isScattered.toggle()
    }
    
    
    func gatherAnimation(){
        UIView.animate(withDuration: 2) {
            
            self.logoImageView.alpha = 1
            
            self.a1Label.backgroundColor = .white
            self.a2Label.backgroundColor = .white
            self.dLabel.backgroundColor = .white
            self.bLabel.backgroundColor = .white
            self.mLabel.backgroundColor = .white
            self.lLabel.backgroundColor = .white
            
            self.a1Label.textColor = .black
            self.a2Label.textColor = .black
            self.dLabel.textColor = .black
            self.bLabel.textColor = .black
            self.mLabel.textColor = .black
            self.lLabel.textColor = .black
            
            self.a1Label.transform = .identity
            self.a2Label.transform = .identity
            self.mLabel.transform = .identity
            self.bLabel.transform = .identity
            self.lLabel.transform = .identity
            self.dLabel.transform = .identity
            
            self.a1Label.center = self.a1Origin
            self.a2Label.center = self.a2Origin
            self.dLabel.center = self.dOrigin
            self.bLabel.center = self.bOrigin
            self.mLabel.center = self.mOrigin
            self.lLabel.center = self.lOrigin
        }
        
        lLabel.layer.borderWidth = 0
        a1Label.layer.borderWidth = 0
        mLabel.layer.borderWidth = 0
        bLabel.layer.borderWidth = 0
        dLabel.layer.borderWidth = 0
        a2Label.layer.borderWidth = 0
        isScattered.toggle()
    }
    
//  MARK: + Alternate Animation Functions

    
    func scatterAltAnimation(){
        UIView.animate(withDuration: 7) {
            self.logoImageView.alpha = 0
            
            self.a1Label.backgroundColor = .random
            self.a2Label.backgroundColor = .random
            self.dLabel.backgroundColor = .random
            self.bLabel.backgroundColor = .random
            self.mLabel.backgroundColor = .random
            self.lLabel.backgroundColor = .random
            
            self.lLabel.textColor = .random
            self.a1Label.textColor = .random
            self.mLabel.textColor = .random
            self.bLabel.textColor = .random
            self.dLabel.textColor = .random
            self.a2Label.textColor = .random
            
            self.lLabel.transform = CGAffineTransform(scaleX: .random(in: 0...600), y: .random(in: 0...600))
            self.a1Label.transform = CGAffineTransform(scaleX: .random(in: 0...600), y: .random(in: 0...600))
            self.mLabel.transform = CGAffineTransform(scaleX: .random(in: 0...600), y: .random(in: 0...600))
            self.bLabel.transform = CGAffineTransform(scaleX: .random(in: 0...600), y: .random(in: 0...600))
            self.dLabel.transform = CGAffineTransform(scaleX: .random(in: 0...600), y: .random(in: 0...600))
            self.a2Label.transform = CGAffineTransform(scaleX: .random(in: 0...600), y: .random(in: 0...600))
            
            self.lLabel.transform = CGAffineTransform(rotationAngle: self.random_angle1)
            self.a1Label.transform = CGAffineTransform(rotationAngle: self.random_angle2)
            self.mLabel.transform = CGAffineTransform(rotationAngle: self.random_angle3)
            self.bLabel.transform = CGAffineTransform(rotationAngle: self.random_angle4)
            self.dLabel.transform = CGAffineTransform(rotationAngle: self.random_angle5)
            self.a2Label.transform = CGAffineTransform(rotationAngle: self.random_angle6)
            
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.a1Label.center = CGPoint(x: .random(in: 0...350), y: .random(in: -140...600))
                    self.a2Label.center = CGPoint(x: .random(in: 0...350), y: .random(in: -140...600))
                    self.lLabel.center = CGPoint(x: .random(in: 150...350), y: .random(in: -140...600))
                    self.mLabel.center = CGPoint(x: .random(in: 0...350), y: .random(in: -140...600))
                    self.bLabel.center = CGPoint(x: .random(in: 0...350), y: .random(in: -140...600))
                    self.dLabel.center = CGPoint(x: .random(in: 0...350), y: .random(in: -140...600))
                }
            }, completion: nil)
            
            self.view.backgroundColor = .random
        }
        
        isScattered.toggle()
    }
    func gatherAltAnimation(){
       
        lLabel.layer.cornerRadius = 12
        a1Label.layer.cornerRadius = 12
        mLabel.layer.cornerRadius = 12
        bLabel.layer.cornerRadius = 12
        dLabel.layer.cornerRadius = 12
        a2Label.layer.cornerRadius = 12
        
        lLabel.layer.borderWidth = 1
        a1Label.layer.borderWidth = 1
        mLabel.layer.borderWidth = 1
        bLabel.layer.borderWidth = 1
        dLabel.layer.borderWidth = 1
        a2Label.layer.borderWidth = 1
        
        UIView.animate(withDuration: 2) {
            
            self.logoImageView.alpha = 1
            
            self.a1Label.backgroundColor = .white
            self.a2Label.backgroundColor = .white
            self.dLabel.backgroundColor = .white
            self.bLabel.backgroundColor = .white
            self.mLabel.backgroundColor = .white
            self.lLabel.backgroundColor = .white
            
            self.a1Label.textColor = .black
            self.a2Label.textColor = .black
            self.dLabel.textColor = .black
            self.bLabel.textColor = .black
            self.mLabel.textColor = .black
            self.lLabel.textColor = .black
            
            self.a1Label.transform = .identity
            self.a2Label.transform = .identity
            self.mLabel.transform = .identity
            self.bLabel.transform = .identity
            self.lLabel.transform = .identity
            self.dLabel.transform = .identity
            
            self.a1Label.center = self.a1Origin
            self.a2Label.center = self.a2Origin
            self.dLabel.center = self.dOrigin
            self.bLabel.center = self.bOrigin
            self.mLabel.center = self.mOrigin
            self.lLabel.center = self.lOrigin
            }
        isScattered.toggle()
    }
    
    // MARK: +IBActions
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered == false {
            scatterAnimation()
        } else {
            gatherAnimation()
        }
        
        
    }
    @IBAction func altScatter(_ sender: Any) {
        if isScattered == false {
            scatterAltAnimation()
        } else {
            gatherAltAnimation()
        }
    }
    
}

// MARK: +Extensions
extension UIColor {
    static var random: UIColor {
        return  UIColor(red: .random(in: 0...1),
                        green: .random(in: 0...1),
                        blue: .random(in: 0...1),
                        alpha: 1.0)
    }
}
