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
    var labels = [UILabel]()

    var initialCenters: [CGPoint] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lambdaLogo.image = UIImage(named: "lambda_logo")
        labels = [lLabel, aLabel, mLabel, bLabel, dlabel, secondALabel]
        setLableCenter()
      
   }

    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dlabel: UILabel!
    @IBOutlet weak var secondALabel: UILabel!
    
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    
    func setLableCenter() {
        
        let labels = [lLabel, aLabel, mLabel, bLabel, dlabel, secondALabel]
        for label in labels {
            guard let label = label else { return }
            self.initialCenters.append(label.center)
        }
    }
    func reArrangeLabels() {
    let labels = [lLabel, aLabel, mLabel, bLabel, dlabel, secondALabel]
    
    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
    var count = 0
    for label in labels {
    guard let label = label else { return }
    label.center = self.initialCenters[count]
    label.transform = .identity
    count += 1
    }
    })
}
    
    
    
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
        secondALabel.backgroundColor = ViewController.randomColor()
        // Move the letters ...
        
       
            UIView.animate(withDuration: 4) {
                self.lLabel.center = CGPoint.random(x: 40...400, y: 100...800)
                self.lLabel.transform = CGAffineTransform(rotationAngle: .randomAngle)
            }
        
            UIView.animate(withDuration: 4) {
                self.aLabel.center = CGPoint.random(x: 40...400, y: 100...800)
                self.aLabel.transform = CGAffineTransform(rotationAngle: .randomAngle)
            }
        
            UIView.animate(withDuration: 4) {
                self.mLabel.center = CGPoint.random(x: 40...400, y: 100...800)
                self.mLabel.transform = CGAffineTransform(rotationAngle: .randomAngle)
            }
        
            UIView.animate(withDuration: 4) {
                self.bLabel.center = CGPoint.random(x: 40...400, y: 100...800)
                self.bLabel.transform = CGAffineTransform(rotationAngle: .randomAngle)
            }
            UIView.animate(withDuration: 4) {
                self.dlabel.center = CGPoint.random(x: 40...400, y: 100...800)
                self.dlabel.transform = CGAffineTransform(rotationAngle: .randomAngle)
            }
            UIView.animate(withDuration: 4) {
                self.secondALabel.center = CGPoint.random(x: 40...400, y: 100...800)
                self.secondALabel.transform = CGAffineTransform(rotationAngle: .randomAngle)
        }
        
        
        
        
        UIView.animate(withDuration: 2, delay: 0, options: [.beginFromCurrentState], animations: {
            self.lambdaLogo.alpha = 0
            self.isScattered = true
            //any animatable property you change in this closure will be animated
        })
        
    }
    
    func gather() {
    
        lLabel.textColor = UIColor.black
        aLabel.textColor = UIColor.black
        mLabel.textColor = UIColor.black
        bLabel.textColor = UIColor.black
        dlabel.textColor = UIColor.black
        secondALabel.textColor = UIColor.black
        // Change Background Color
        lLabel.backgroundColor = UIColor.clear
        aLabel.backgroundColor = UIColor.clear
        mLabel.backgroundColor = UIColor.clear
        bLabel.backgroundColor = UIColor.clear
        dlabel.backgroundColor = UIColor.clear
        secondALabel.backgroundColor = UIColor.clear
    
       reArrangeLabels()
    
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
