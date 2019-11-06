//
//  ViewController.swift
//  ScatterandGather
//
//  Created by Thomas Sabino-Benowitz on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class lambdaViewController: UIViewController {
    var isScattered: Bool = false
    var random_angle1 = CGFloat(Int.random(in: 0...360))
    var random_angle2 = CGFloat(Int.random(in: 0...360))
    var random_angle3 = CGFloat(Int.random(in: 0...360))
    var random_angle4 = CGFloat(Int.random(in: 0...360))
    var random_angle5 = CGFloat(Int.random(in: 0...360))
    var random_angle6 = CGFloat(Int.random(in: 0...360))

    @IBOutlet weak var a2Label: UILabel!
    
    @IBOutlet weak var dLabel: UILabel!
    
    @IBOutlet weak var bLabel: UILabel!
    
    @IBOutlet weak var mLabel: UILabel!
    
    @IBOutlet weak var a1Label: UILabel!
    
    @IBOutlet weak var lLabel: UILabel!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureLabels()
        
        let a1Origin = a1Label.cgRect.origin
        let a20rigin = a2Label.frame.origin
        let dOrigin = dLabel.frame.origin
        
    }
    
    private func configureLabels() {
        
//        lLabel.layer.cornerRadius = 12
//        a1Label.layer.cornerRadius = 12
//        mLabel.layer.cornerRadius = 12
//        bLabel.layer.cornerRadius = 12
//        dLabel.layer.cornerRadius = 12
//        a2Label.layer.cornerRadius = 12
//
//        lLabel.layer.borderWidth = 2
//        a1Label.layer.borderWidth = 2
//        mLabel.layer.borderWidth = 2
//        bLabel.layer.borderWidth = 2
//        dLabel.layer.borderWidth = 2
//        a2Label.layer.borderWidth = 2
    }
    
    func scatterAnimation(){
        UIView.animate(withDuration: 2) {
            self.logoImageView.alpha = 0
            
            self.a1Label.backgroundColor = .random
            self.a2Label.backgroundColor = .random
            self.dLabel.backgroundColor = .random
            self.bLabel.backgroundColor = .random
            self.mLabel.backgroundColor = .random
            self.lLabel.backgroundColor = .random
            
            self.lLabel.textColor = .random
            self.a1Label.textColor = .random
            self.mLabel.textColor = .random
            self.bLabel.textColor = .random
            self.dLabel.textColor = .random
            self.a2Label.textColor = .random
            
            self.lLabel.transform = CGAffineTransform(rotationAngle: self.random_angle1)
            self.a1Label.transform = CGAffineTransform(rotationAngle: self.random_angle2)
            self.mLabel.transform = CGAffineTransform(rotationAngle: self.random_angle3)
            self.bLabel.transform = CGAffineTransform(rotationAngle: self.random_angle4)
            self.dLabel.transform = CGAffineTransform(rotationAngle: self.random_angle5)
            self.a2Label.transform = CGAffineTransform(rotationAngle: self.random_angle6)
            
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.a1Label.center = CGPoint(x: .random(in: 0...200), y: .random(in: 0...400))
                    self.a2Label.center = CGPoint(x: .random(in: 0...200), y: .random(in: 0...400))
                    self.lLabel.center = CGPoint(x: .random(in: 0...200), y: .random(in: 0...400))
                    self.mLabel.center = CGPoint(x: .random(in: 0...200), y: .random(in: 0...400))
                    self.bLabel.center = CGPoint(x: .random(in: 0...200), y: .random(in: 0...400))
                    self.dLabel.center = CGPoint(x: .random(in: 0...200), y: .random(in: 0...400))
                }
            }, completion: nil)
            
            self.view.backgroundColor = .random
        }
//        UIView.animate(withDuration: 2, animations: {
//            self.a1Label.backgroundColor = .random
//            self.a2Label.backgroundColor = .random
//            self.dLabel.backgroundColor = .random
//            self.bLabel.backgroundColor = .random
//            self.mLabel.backgroundColor = .random
//            self.lLabel.backgroundColor = .random
//
//              }, completion: nil)

        isScattered.toggle()
    }

    
    func gatherAnimation(){
        UIView.animate(withDuration: 2) {
            self.logoImageView.alpha = 1
            
            
            self.a1Label.transform = .identity
            self.a2Label.transform = .identity
            self.mLabel.transform = .identity
            self.bLabel.transform = .identity
            self.lLabel.transform = .identity
            self.dLabel.transform = .identity
            
            self.a1Label.center =
            
            
         

        }
        
        
        isScattered.toggle()
        
      
    }
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered == false {
            scatterAnimation()
        } else {
        gatherAnimation()
        }
    
    
}

}
extension UIColor {
    static var random: UIColor {
        return  UIColor(red: .random(in: 0...1),
                        green: .random(in: 0...1),
                        blue: .random(in: 0...1),
                        alpha: 1.0)
    }
}
