//
//  LambdaScatterViewController.swift
//  LambdaScatter
//
//  Created by admin on 10/8/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class LambdaScatterViewController: UIViewController {
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var lastALabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    
    var isScattered: Bool = false
    
    let imageLogo: ImageModel = ImageModel(name: "lambda_logo")

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        logoImageView.image = imageLogo.image
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        if isScattered {
            isScattered.toggle()
            gatherLetters()
            
            UIView.animate(withDuration: 1.5) {
                self.logoImageView.alpha = 1
            }
        } else {
            isScattered.toggle()
            letterScramble()
            
            UIView.animate(withDuration: 3) {
                self.logoImageView.alpha = 0
            }
        }
        
    }
    
    func letterScramble() {
        
        UIView.animate(withDuration: 3) {
            self.lLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...20)).concatenating(CGAffineTransform(scaleX: .random(in: 0...10), y: .random(in: 0...10)))
        }
        
        backgroundColorChange(theLabel: lLabel)
        
        UIView.animate(withDuration: 3) {
            self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...20)).concatenating(CGAffineTransform(scaleX: .random(in: 0...10), y: .random(in: 0...10)))
        }
        
        backgroundColorChange(theLabel: aLabel)
        
        UIView.animate(withDuration: 3) {
            self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...20)).concatenating(CGAffineTransform(scaleX: .random(in: 0...10), y: .random(in: 0...10)))
        }
        
        backgroundColorChange(theLabel: mLabel)
        
        UIView.animate(withDuration: 3) {
            self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...20)).concatenating(CGAffineTransform(scaleX: .random(in: 0...10), y: .random(in: 0...10)))
        }
        
        backgroundColorChange(theLabel: bLabel)
        
        UIView.animate(withDuration: 3) {
            self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...20)).concatenating(CGAffineTransform(scaleX: .random(in: 0...10), y: .random(in: 0...10)))
        }
        
        backgroundColorChange(theLabel: dLabel)
        
        UIView.animate(withDuration: 3) {
            self.lastALabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...20)).concatenating(CGAffineTransform(scaleX: .random(in: 0...10), y: .random(in: 0...10)))
        }
        
        backgroundColorChange(theLabel: lastALabel)
        
    }
    
    func gatherLetters() {
       
        UIView.animate(withDuration: 1.5) {
            self.lLabel.transform = .identity
        }
        
        UIView.animate(withDuration: 1.5) {
            self.aLabel.transform = .identity
        }
        
        UIView.animate(withDuration: 1.5) {
            self.mLabel.transform = .identity
        }
        
        UIView.animate(withDuration: 1.5) {
            self.bLabel.transform = .identity
        }
        
        UIView.animate(withDuration: 1.5) {
            self.dLabel.transform = .identity
        }
        
        UIView.animate(withDuration: 1.5) {
            self.lastALabel.transform = .identity
        }
        
    }
    
    func backgroundColorChange(theLabel: UILabel) {
        
        let label = theLabel
        
        let colorAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        colorAnimation.fromValue = label.layer.backgroundColor
        
        let color = randomColor()
        
        label.textColor = UIColor(cgColor: color)
        label.layer.borderColor = color
        colorAnimation.toValue = color
        colorAnimation.duration = 1
        colorAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        label.layer.add(colorAnimation, forKey: "backgroundColorAnimation")
        
    }
    
    private func randomColor() -> CGColor {
        let red = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0).cgColor
    }

}
