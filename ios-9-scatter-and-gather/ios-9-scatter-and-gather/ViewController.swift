//
//  ViewController.swift
//  ios-9-scatter-and-gather
//
//  Created by Alex Shillingford on 9/10/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var secondALabel: UILabel!
    @IBOutlet weak var lambdaImageView: UIImageView!
    
    
    var isScattered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        if isScattered {
            gather()
            labelReturn()
            randomColor()
            isScattered = false
        } else {
            scatter()
            labelRandomizer()
            randomColor()
            isScattered = true
        }
    }
    
    func gather() {
        UIView.animate(withDuration: 1, animations: {
            self.lambdaImageView.alpha = 1
        }, completion: nil)
        
        let rotation = CATransform3DMakeRotation(randomRadian(), 0, randomRadian(), 0)
        
        UIView.animate(withDuration: 0.82) {
            self.firstLabel.center.x = 19.75
            self.firstLabel.center.y = 43.0
            self.firstLabel.layer.transform = CATransform3DConcat(self.firstLabel.layer.transform, rotation)
            self.aLabel.center.x = 69.5
            self.aLabel.center.y = 43.0
            self.aLabel.layer.transform = CATransform3DConcat(self.firstLabel.layer.transform, rotation)
            self.mLabel.center.x = 130.75
            self.mLabel.center.y = 43.0
            self.mLabel.layer.transform = CATransform3DConcat(self.firstLabel.layer.transform, rotation)
            self.bLabel.center.x = 193.75
            self.bLabel.center.y = 43.0
            self.bLabel.layer.transform = CATransform3DConcat(self.firstLabel.layer.transform, rotation)
            self.dLabel.center.x = 247.0
            self.dLabel.center.y = 43.0
            self.dLabel.layer.transform = CATransform3DConcat(self.firstLabel.layer.transform, rotation)
            self.secondALabel.center.x = 298.5
            self.secondALabel.center.y = 43.0
            self.secondALabel.layer.transform = CATransform3DConcat(self.firstLabel.layer.transform, rotation)
        }
    }
    
    func scatter() {
        UIView.animate(withDuration: 1, animations: {
            self.lambdaImageView.alpha = 0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.82) {
            self.randomRotation(self.firstLabel)
            self.randomRotation(self.aLabel)
            self.randomRotation(self.mLabel)
            self.randomRotation(self.bLabel)
            self.randomRotation(self.dLabel)
            self.randomRotation(self.secondALabel)
        }
        
    }
    
    func labelRandomizer() {
        
        UIView.animateKeyframes(withDuration: 0.82, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.firstLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.aLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.mLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.bLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.dLabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.secondALabel.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
        })
    }
    
    func labelReturn() {
        UIView.animate(withDuration: 0.82) {
            self.firstLabel.transform = .identity
            self.aLabel.transform = .identity
            self.mLabel.transform = .identity
            self.bLabel.transform = .identity
            self.dLabel.transform = .identity
            self.secondALabel.transform = .identity
        }
    }
    
    func randomColor() {
        self.firstLabel.textColor = self.randomColorGenerator()
        self.firstLabel.backgroundColor = self.randomColorGenerator()
        self.aLabel.textColor = self.randomColorGenerator()
        self.aLabel.backgroundColor = self.randomColorGenerator()
        self.mLabel.textColor = self.randomColorGenerator()
        self.mLabel.backgroundColor = self.randomColorGenerator()
        self.bLabel.textColor = self.randomColorGenerator()
        self.bLabel.backgroundColor = self.randomColorGenerator()
        self.dLabel.textColor = self.randomColorGenerator()
        self.dLabel.backgroundColor = self.randomColorGenerator()
        self.secondALabel.textColor = self.randomColorGenerator()
        self.secondALabel.backgroundColor = self.randomColorGenerator()
    }
    
    func randomAngle() -> CGFloat {
        let randomAngleNumber = CGFloat.random(in: 0...30)
        
        return randomAngleNumber
    }
    
    func randomColorGenerator() -> UIColor {
        let randomColorSelection = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        
        return randomColorSelection
    }
    
    func randomRadian() -> CGFloat {
        return CGFloat(200 * Double.pi /  Double.random(in: 1...360))
    }
    
    func randomRotation(_ label: UILabel) {
        let rotation = CATransform3DMakeRotation(randomRadian(), 0, randomRadian(), 0)
        
        label.center.x += CGFloat.random(in: -20...150)
        label.center.y += CGFloat.random(in: -20...750)
        label.layer.transform = CATransform3DConcat(self.firstLabel.layer.transform, rotation)
    }
}

