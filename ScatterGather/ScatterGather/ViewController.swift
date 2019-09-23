//
//  ViewController.swift
//  ScatterGather
//
//  Created by Jessie Ann Griffin on 9/22/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let angles = [CGFloat.pi / 4, CGFloat.pi / 6, -CGFloat.pi / 4, -CGFloat.pi / 6, CGFloat.pi / 3, -CGFloat.pi / 3]
    
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        fadeAndScatter()
        fadeAndGather()
    }
    
    func generateRandomNumber() -> CGFloat {
        let num = CGFloat(arc4random_uniform(250))
        return num
    }
    
    func randomAngle() -> CGFloat {
        let angle = angles[Int(arc4random_uniform(UInt32(angles.count)))]
        return angle
    }
    
    func configureLambda() {
        // MARK: Labels
        
        
        // MARK: StackView
        let lambda = UIStackView()
        lambda.axis = .horizontal
        lambda.distribution = .equalSpacing
        lambda.addArrangedSubview(self.letterL)
        lambda.addArrangedSubview(self.letterA)
        lambda.addArrangedSubview(self.letterM)
        lambda.addArrangedSubview(self.letterB)
        lambda.addArrangedSubview(self.letterD)
        lambda.addArrangedSubview(self.letterA2)
        
    }
    
    @objc func fadeAndScatter() {
      
        let scatterBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.45, animations: {
                self.logoImage.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterL.center = CGPoint(x: self.generateRandomNumber(), y: self.generateRandomNumber())
                self.letterL.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterA.center = CGPoint(x: self.generateRandomNumber(), y: self.generateRandomNumber())
                self.letterA.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterM.center = CGPoint(x: self.generateRandomNumber(), y: self.generateRandomNumber())
                self.letterM.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterB.center = CGPoint(x: self.generateRandomNumber(), y: self.generateRandomNumber())
                self.letterM.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterD.center = CGPoint(x: self.generateRandomNumber(), y: self.generateRandomNumber())
                self.letterD.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterA2.center = CGPoint(x: self.generateRandomNumber(), y: self.generateRandomNumber())
                self.letterA2.transform = CGAffineTransform(rotationAngle: self.randomAngle())
            })
        }
        UIView.animateKeyframes(withDuration: 3.5, delay: 0.0, options: [], animations: scatterBlock, completion: nil)

    }
    
    @objc func fadeAndGather() {
        let gatherBlock = {
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.45, animations: {
                self.logoImage.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterL.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterA.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterM.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterB.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterD.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                // Could do this with a CGAffineTransform (translation) as well
                self.letterA2.transform = .identity
            })

        }
        UIView.animateKeyframes(withDuration: 3.5, delay: 0.0, options: [], animations: gatherBlock, completion: nil)

    }
        
        
//        UIView.animateKeyframes(withDuration: 3.5, delay: 0.0, options: [.autoreverse], animations: scatterBlock, completion: nil)
}

