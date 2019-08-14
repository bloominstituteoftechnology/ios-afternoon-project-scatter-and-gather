//
//  ViewController.swift
//  Scatter
//
//  Created by Nathan Hedgeman on 8/14/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //Properties
    
    var animationTime: Double = 1
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    
    var isPressed: Bool = false
    
}

extension MainViewController {
    
    func scatter() {
        let labelArray: [UILabel] = [lLabel, aLabel, mLabel, bLabel, dLabel, a2Label]

        for x in labelArray {
            animate(label: x)
        }
    }
    
    func gather() {
        let labelArray: [UILabel] = [lLabel, aLabel, mLabel, bLabel, dLabel, a2Label]
        
        for x in labelArray {
            reset(label: x)
        }
    }
    
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        if isPressed {
            gather()
            UIView.animate(withDuration: animationTime, animations: {
                self.logo.alpha = 1
            }, completion: nil)
        } else {
            scatter()
            UIView.animate(withDuration: 0.5, animations: {
                self.logo.alpha = 0
            }, completion: nil)
        }
        isPressed = !isPressed
    }
    
    func animate(label: UILabel) {
        
        //Background Color
        UILabel.animate(withDuration: animationTime, animations: {
            label.layer.backgroundColor = UIColor.random().cgColor
        }, completion: nil)
        
        //Rotation And Position
        UILabel.animate(withDuration: animationTime) {
            label.transform = CGAffineTransform(rotationAngle: .random(in: 0...10))
                .concatenating(CGAffineTransform(translationX: CGFloat.random(in: -50...50), y: CGFloat.random(in: -150...400)))
        }
        
        //Text Color
        UILabel.animate(withDuration: animationTime, animations: {
            label.textColor = UIColor.random()
        }, completion: nil)
    }
    
    func reset(label: UILabel) {
        UIView.animate(withDuration: animationTime, animations: {
            label.transform = .identity
            label.layer.backgroundColor = UIColor.clear.cgColor
            label.textColor = UIColor.black
        }, completion: nil)
    }
}
    
    extension UIColor {

        static func random() -> UIColor {
            let hue = CGFloat.random(in: 0...1)
            let saturation = CGFloat.random(in: 0.2...1)
            let brightness = CGFloat.random(in: 0.2...1)
            let alpha = CGFloat.random(in: 0.5...1)
            
            let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
            
            return color
        }
}
