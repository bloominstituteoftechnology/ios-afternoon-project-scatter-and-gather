//
//  AnimationViewController.swift
//  Scatter and Gather Animations
//
//  Created by Chris Dobek on 4/14/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    var isScattered: Bool = false

    var centerOfL = CGPoint()
    var centerOfFirstA = CGPoint()
    var centerOfM = CGPoint()
    var centerOfB = CGPoint()
    var centerOfD = CGPoint()
    var centerOfSecondA = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lambdaLogo.image = UIImage(named: "lambda_logo")
        captureCenters()
    }
    
    func captureCenters() {
        self.centerOfL = self.lLabel.center
        self.centerOfFirstA = self.aLabel.center
        self.centerOfM = self.mLabel.center
        self.centerOfB = self.bLabel.center
        self.centerOfD = self.dLabel.center
        self.centerOfSecondA = self.a2Label.center
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {

            if isScattered == false {

                self.isScattered = true
                let animationBlock = {

                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                        self.lambdaLogo.alpha = 0

                        self.lLabel.center.x = CGFloat(Int.random(in: 20...250))
                        self.lLabel.center.y = CGFloat(Int.random(in: 260...640))
                        self.lLabel.backgroundColor = .random()
                        self.lLabel.textColor = .random()
                        self.lLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))

                        self.aLabel.center.x = CGFloat(Int.random(in: 20...250))
                        self.aLabel.center.y = CGFloat(Int.random(in: 260...640))
                        self.aLabel.backgroundColor = .random()
                        self.aLabel.textColor = .random()
                        self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))

                        self.mLabel.center.x = CGFloat(Int.random(in: 20...250))
                        self.mLabel.center.y = CGFloat(Int.random(in: 260...640))
                        self.mLabel.backgroundColor = .random()
                        self.mLabel.textColor = .random()
                        self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))

                        self.bLabel.center.x = CGFloat(Int.random(in: 20...250))
                        self.bLabel.center.y = CGFloat(Int.random(in: 260...640))
                        self.bLabel.backgroundColor = .random()
                        self.bLabel.textColor = .random()
                        self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))

                        self.dLabel.center.x = CGFloat(Int.random(in: 20...250))
                        self.dLabel.center.y = CGFloat(Int.random(in: 260...640))
                        self.dLabel.backgroundColor = .random()
                        self.dLabel.textColor = .random()
                        self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))

                        self.a2Label.center.x = CGFloat(Int.random(in: 20...250))
                        self.a2Label.center.y = CGFloat(Int.random(in: 260...640))
                        self.a2Label.backgroundColor = .random()
                        self.a2Label.textColor = .random()
                        self.a2Label.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...5)))

                    }

                }
                UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: animationBlock, completion: nil)

            } else {

                self.isScattered = false

                let animationBlock = {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                        self.lambdaLogo.alpha = 1

                        self.lLabel.transform = .identity
                        self.lLabel.backgroundColor = .none
                        self.lLabel.textColor = .black
                        self.lLabel.center = self.centerOfL

                        self.aLabel.transform = .identity
                        self.aLabel.backgroundColor = .none
                        self.aLabel.textColor = .black
                        self.aLabel.center = self.centerOfFirstA

                        self.mLabel.transform = .identity
                        self.mLabel.backgroundColor = .none
                        self.mLabel.textColor = .black
                        self.mLabel.center = self.centerOfM

                        self.bLabel.transform = .identity
                        self.bLabel.backgroundColor = .none
                        self.bLabel.textColor = .black
                        self.bLabel.center = self.centerOfB

                        self.dLabel.transform = .identity
                        self.dLabel.backgroundColor = .none
                        self.dLabel.textColor = .black
                        self.dLabel.center = self.centerOfD

                        self.a2Label.transform = .identity
                        self.a2Label.backgroundColor = .none
                        self.a2Label.textColor = .black
                        self.a2Label.center = self.centerOfSecondA

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
