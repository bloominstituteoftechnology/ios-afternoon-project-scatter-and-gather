//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Nonye on 5/12/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - LABEL OUTLETS
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    @IBOutlet weak var lambdaLogo: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        lambdaLogo.image = UIImage(named: "lambda_logo")
        centerLetters()
        setScreenBackground()
      
    }


    var isScattered: Bool = false
    
    var centerOfL = CGPoint()
    var centerOfFirstA = CGPoint()
    var centerOfM = CGPoint()
    var centerOfB = CGPoint()
    var centerOfD = CGPoint()
    var centerOfSecondA = CGPoint()
    
    func centerLetters() {
        self.centerOfL = self.letterL.center
        self.centerOfFirstA = self.letterA.center
        self.centerOfM = self.letterM.center
        self.centerOfB = self.letterB.center
        self.centerOfD = self.letterD.center
        self.centerOfSecondA = self.letterA2.center
    }
    
    func setScreenBackground() {
        view.backgroundColor = .random()
    }
    //MARK: - TOGGLE BUTTON PRESSED
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        if isScattered == false {
            
            self.isScattered = true
            let animationLettersMoving = {
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.lambdaLogo.alpha = 0
                    
                    self.letterL.alpha = 0.5
                    self.letterL.center.x = CGFloat(Int.random(in: 0...200))
                    self.letterL.center.y = CGFloat(Int.random(in: 300...500))
                    self.letterL.backgroundColor = .random()
                    self.letterL.layer.borderWidth = 2
                    self.letterL.textColor = .random()
                    self.letterL.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...10)))
                    
                    self.letterA.alpha = 0.5
                    self.letterA.center.x = CGFloat(Int.random(in: 0...250))
                    self.letterA.center.y = CGFloat(Int.random(in: 300...500))
                    self.letterA.backgroundColor = .random()
                    self.letterA.layer.borderWidth = 2
                    self.letterA.textColor = .random()
                    self.letterA.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...10)))
                    
                    self.letterM.alpha = 0.5
                    self.letterM.center.x = CGFloat(Int.random(in: 0...250))
                    self.letterM.center.y = CGFloat(Int.random(in: 300...500))
                    self.letterM.backgroundColor = .random()
                    self.letterM.layer.borderWidth = 2
                    self.letterM.textColor = .random()
                    self.letterM.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...10)))
                    
                    self.letterB.alpha = 0.5
                    self.letterB.center.x = CGFloat(Int.random(in: 0...250))
                    self.letterB.center.y = CGFloat(Int.random(in: 300...500))
                    self.letterB.backgroundColor = .random()
                    self.letterM.layer.borderWidth = 2
                    self.letterB.textColor = .random()
                    self.letterB.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...10)))
                    
                    self.letterD.alpha = 0.5
                    self.letterD.center.x = CGFloat(Int.random(in: 0...250))
                    self.letterD.center.y = CGFloat(Int.random(in: 300...500))
                    self.letterD.backgroundColor = .random()
                    self.letterD.layer.borderWidth = 2
                    self.letterD.textColor = .random()
                    self.letterD.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...10)))
                    
                    self.letterA2.alpha = 0.5
                    self.letterA2.center.x = CGFloat(Int.random(in: 0...250))
                    self.letterA2.center.y = CGFloat(Int.random(in: 300...500))
                    self.letterA2.backgroundColor = .random()
                    self.letterA2.layer.borderWidth = 2
                    self.letterA2.textColor = .random()
                    self.letterA2.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: 1...10)))
                }
            }
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: animationLettersMoving, completion: nil)
            
        } else {
            self.isScattered = false
        
            let letterAnimation = {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.7) {
                    self.lambdaLogo.alpha = 1
                    
                    self.letterL.center = self.centerOfL
                    self.letterL.transform = .identity
                    self.letterL.layer.borderWidth = 2
                    self.letterL.backgroundColor = .purple
                    self.letterL.textColor = .black
                    
                    self.letterA.center = self.centerOfFirstA
                    self.letterA.transform = .identity
                    self.letterA.layer.borderWidth = 2
                    self.letterA.backgroundColor = .random()
                    self.letterA.textColor = .black
                    
                    self.letterM.center = self.centerOfM
                    self.letterM.transform = .identity
                    self.letterM.layer.borderWidth = 2
                    self.letterM.backgroundColor = .purple
                    self.letterM.textColor = .black
                    
                    self.letterB.center = self.centerOfB
                    self.letterB.transform = .identity
                    self.letterB.layer.borderWidth = 2
                    self.letterB.backgroundColor = .random()
                    self.letterB.textColor = .black
                    
                    self.letterD.center = self.centerOfD
                    self.letterD.transform = .identity
                    self.letterD.layer.borderWidth = 2
                    self.letterD.backgroundColor = .purple
                    self.letterD.textColor = .black
                    
                    self.letterA2.center = self.centerOfSecondA
                    self.letterA2.transform = .identity
                    self.letterA2.layer.borderWidth = 2
                    self.letterA2.backgroundColor = .random()
                    self.letterA2.textColor = .black
                }
            }
            
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: letterAnimation, completion: nil)
        }
    }
}

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
