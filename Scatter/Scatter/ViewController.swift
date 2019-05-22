//
//  ViewController.swift
//  Scatter
//
//  Created by Ryan Murphy on 5/22/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isScattered: Bool = false
    var labels: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lambdaLogo.image = UIImage(named: "lambda_logo")
        let labels: [UILabel] = [lLabel, aLabel, mLabel, bLabel, dlabel, secondALabel]
    }

    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dlabel: UILabel!
    @IBOutlet weak var secondALabel: UILabel!
    
    @IBOutlet weak var lambdaLogo: UIImageView!
    
   
    
//    func rotateRandom() {
//        let labels: [UILabel] = [lLabel, aLabel, mLabel, bLabel, dlabel, secondALabel]
//        let random = {CGFloat(arc4random_uniform(180)) }
//
//        for label in labels {
//            UIView.animateKeyframes(withDuration: 4, delay: 0, options: .calculationModeLinear, animations: {
//
//                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
//                    // set rotation in radians
//                    label.transform = CGAffineTransform(rotationAngle: CGFloat(random).toRadians())
//
//                })
//            })
//
//        }
//    }
    
    
    
    static func randomColor() -> UIColor {
        let random = {CGFloat(arc4random_uniform(255)) / 255.0}
        return UIColor(red: random(), green: random(), blue: random(), alpha: 1)
    }
    
    func scatter() {
        //Change Text Color
        lambdaLogo.alpha = 1
        lLabel.textColor = ViewController.randomColor()
        aLabel.textColor = ViewController.randomColor()
        mLabel.textColor = ViewController.randomColor()
        bLabel.textColor = ViewController.randomColor()
        dlabel.textColor = ViewController.randomColor()
        secondALabel.textColor = ViewController.randomColor()
        // Change Background Color
        lLabel.backgroundColor = ViewController.randomColor()
        aLabel.backgroundColor = ViewController.randomColor()
        mLabel.backgroundColor = ViewController.randomColor()
        bLabel.backgroundColor = ViewController.randomColor()
        dlabel.backgroundColor = ViewController.randomColor()
        dlabel.backgroundColor = ViewController.randomColor()
        secondALabel.backgroundColor = ViewController.randomColor()
        // Move the letters ...
        lLabel.center = CGPoint.random(x: 40...400, y: 100...800)
        print(lLabel.center)
        lLabel.transform = CGAffineTransform(rotationAngle: .randomAngle)
        
        
        UIView.animate(withDuration: 2, delay: 0, options: [.beginFromCurrentState], animations: {
            self.lambdaLogo.alpha = 0
            self.isScattered = true
            //any animatable property you change in this closure will be animated
        })
        
    }
    
    func gather() {
    
        lambdaLogo.alpha = 0
        UIView.animate(withDuration: 2, delay: 0, options: [.beginFromCurrentState], animations: {
            self.lambdaLogo.alpha = 1
            self.isScattered = false
    })
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered == false {
            scatter()
        } else { gather() }
    }
    
}
extension CGFloat {
    static var randomAngle: CGFloat { return CGFloat.random(in: 0...360) * CGFloat.pi / 180 }
}

extension CGPoint {
    static func random(x: ClosedRange<Int>, y: ClosedRange<Int>) -> CGPoint {
        return CGPoint(x: Int.random(in: x), y: Int.random(in: y))
    }
}
