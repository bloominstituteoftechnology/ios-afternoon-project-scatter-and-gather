//
//  ViewController.swift
//  ScatterAndGatherAnimations
//
//  Created by Bhawnish Kumar on 3/17/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

enum scatOrGat: String {
       case scattered = "Scattered"
       case gathered = "Gathered"
   }
class ViewController: UIViewController {
    
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA1: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    
    @IBOutlet weak var toggleButtonTapped: UIBarButtonItem!
    
    var isScattered: Bool?
    //MARK: Lambda Image View Property
    @objc let lambdaImageView: UIImageView = {
       let theImageView = UIImageView()
       theImageView.image = UIImage(named: "lambda_logo.png")
       theImageView.translatesAutoresizingMaskIntoConstraints = false 
       return theImageView
    }()
     
   
    override func viewDidLoad() {
       super.viewDidLoad()
       someImageViewConstraints()
      
        
    }

 
    @IBAction func toggleButtonPressed(_ sender: Any) {
     
        
        if self.lambdaImageView.alpha == 0.0 {
            UIView.animate(withDuration: 1.5, delay: 0.2, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.lambdaImageView.alpha = 1.0
            })
            gatheringLabels()
        } else {
            UIView.animate(withDuration: 1.5, delay: 0.2, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.lambdaImageView.alpha = 0.0
            })
           scatterLabels()
            
        }
    }
//     MARK: Lambda Image View Function
    func someImageViewConstraints() {
           view.addSubview(lambdaImageView)
         lambdaImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
         lambdaImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
         lambdaImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         lambdaImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
     }
    

    func scatterLabels() {
        let allLabels: [UILabel] = [letterL,
                                    letterA1,
                                    letterM,
                                    letterB,
                                    letterD,
                                    letterA2]
//        MARK: Properies for CGPoint for random numbers
        let randomX = {
            Int(self.view.frame.maxX) - 50
        }
        let randomY = {
            Int(self.view.frame.maxY) - 55
        }
        let uiColors = [UIColor.blue, UIColor.red, UIColor.yellow, UIColor.orange, UIColor.purple, UIColor.brown, UIColor.green, UIColor.systemPink]
        for label in allLabels {
            label.center = CGPoint(x: Int.random(in: 0...randomX()), y: Int.random(in: 0...randomY()))
            label.textColor = uiColors[Int.random(in: 0..<8)]

            let animationBlock = {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                    label.center = self.view.center
                }
                
                
            }
            UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: animationBlock, completion: nil)
        }

}
    func gatheringLabels() {
        let allLabels: [UILabel] = [letterL,
        letterA1,
        letterM,
        letterB,
        letterD,
        letterA2]
        
        for label in allLabels {
            label.center.y = 16
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        self.letterL.center.x = 15
                       self.letterA1.center.x = 70
                       self.letterM.center.x = 140
                       self.letterB.center.x = 200
                       self.letterD.center.x = 250
                       self.letterA2.center.x = 320
    }
    
    
        
}

extension UIView {

    func fadeIn(_ duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
    }, completion: completion)  }

    func fadeOut(_ duration: TimeInterval = 1.5, delay: TimeInterval = 1.5, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.3
    }, completion: completion)
   }
}


