//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Waseem Idelbi on 4/12/20.
//  Copyright © 2020 WaseemID. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -Properties and IBOutlets-
    
    var isScattered: Bool = false
    
    var centerOfL = CGPoint()
    var centerOfFirstA = CGPoint()
    var centerOfM = CGPoint()
    var centerOfB = CGPoint()
    var centerOfD = CGPoint()
    var centerOfSecondA = CGPoint()
    
    @IBOutlet var letterL: UILabel!
    @IBOutlet var letterFirstA: UILabel!
    @IBOutlet var letterM: UILabel!
    @IBOutlet var letterB: UILabel!
    @IBOutlet var letterD: UILabel!
    @IBOutlet var letterSecondA: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    //MARK: -Methods and IBActions-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "lambda_logo")
        captureCenters()
    }
    
    func captureCenters() {
        self.centerOfL = self.letterL.center
        self.centerOfFirstA = self.letterFirstA.center
        self.centerOfM = self.letterM.center
        self.centerOfB = self.letterB.center
        self.centerOfD = self.letterD.center
        self.centerOfSecondA = self.letterSecondA.center
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        if isScattered == false {
            
            self.isScattered = true
            let animationBlock = {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.imageView.alpha = 0
                    
                    self.letterL.center.x = CGFloat(Int.random(in: 20...250))
                    self.letterL.center.y = CGFloat(Int.random(in: 260...640))
                    self.letterL.backgroundColor = .random()
                    self.letterL.textColor = .random()
                    self.letterL.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))
                    
                    self.letterFirstA.center.x = CGFloat(Int.random(in: 20...250))
                    self.letterFirstA.center.y = CGFloat(Int.random(in: 260...640))
                    self.letterFirstA.backgroundColor = .random()
                    self.letterFirstA.textColor = .random()
                    self.letterFirstA.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))
                    
                    self.letterM.center.x = CGFloat(Int.random(in: 20...250))
                    self.letterM.center.y = CGFloat(Int.random(in: 260...640))
                    self.letterM.backgroundColor = .random()
                    self.letterM.textColor = .random()
                    self.letterM.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))
                    
                    self.letterB.center.x = CGFloat(Int.random(in: 20...250))
                    self.letterB.center.y = CGFloat(Int.random(in: 260...640))
                    self.letterB.backgroundColor = .random()
                    self.letterB.textColor = .random()
                    self.letterB.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))
                    
                    self.letterD.center.x = CGFloat(Int.random(in: 20...250))
                    self.letterD.center.y = CGFloat(Int.random(in: 260...640))
                    self.letterD.backgroundColor = .random()
                    self.letterD.textColor = .random()
                    self.letterD.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))
                    
                    self.letterSecondA.center.x = CGFloat(Int.random(in: 20...250))
                    self.letterSecondA.center.y = CGFloat(Int.random(in: 260...640))
                    self.letterSecondA.backgroundColor = .random()
                    self.letterSecondA.textColor = .random()
                    self.letterSecondA.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))
                    
                }
                
            }
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: animationBlock, completion: nil)
            
        } else {
            
            self.isScattered = false
            
            let animationBlock = {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.imageView.alpha = 1
                    
                    self.letterL.transform = .identity
                    self.letterL.backgroundColor = .none
                    self.letterL.textColor = .black
                    self.letterL.center = self.centerOfL
                    
                    self.letterFirstA.transform = .identity
                    self.letterFirstA.backgroundColor = .none
                    self.letterFirstA.textColor = .black
                    self.letterFirstA.center = self.centerOfFirstA
                    
                    self.letterM.transform = .identity
                    self.letterM.backgroundColor = .none
                    self.letterM.textColor = .black
                    self.letterM.center = self.centerOfM
                    
                    self.letterB.transform = .identity
                    self.letterB.backgroundColor = .none
                    self.letterB.textColor = .black
                    self.letterB.center = self.centerOfB
                    
                    self.letterD.transform = .identity
                    self.letterD.backgroundColor = .none
                    self.letterD.textColor = .black
                    self.letterD.center = self.centerOfD
                    
                    self.letterSecondA.transform = .identity
                    self.letterSecondA.backgroundColor = .none
                    self.letterSecondA.textColor = .black
                    self.letterSecondA.center = self.centerOfSecondA
                    
                }
            }
            
            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: animationBlock, completion: nil)
        }
        
    }
    
    
} //End of class

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}
