//
//  NewViewController.swift
//  LambdaAnimation
//
//  Created by Bradley Diroff on 3/17/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    @IBOutlet var lambdaSign: UIImageView!
    
    @IBOutlet var letL: UILabel!
    @IBOutlet var letA: UILabel!
    @IBOutlet var letM: UILabel!
    @IBOutlet var letB: UILabel!
    @IBOutlet var letD: UILabel!
    @IBOutlet var letA2: UILabel!
    
    var isToggled: Bool = false
    
    var startPointL: CGPoint?
    var startPointA: CGPoint?
    var startPointM: CGPoint?
    var startPointB: CGPoint?
    var startPointD: CGPoint?
    var startPointA2: CGPoint?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addSubviews()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isToggled == false {
            messUpLetters()
        } else {
            returnToNormal()
        }
    }
    
    func messUpLetters() {
        
        UIView.animate(withDuration: 1) {
            self.lambdaSign.alpha = 0
            self.letL.textColor = self.randomColor()
            self.letL.layer.backgroundColor = self.randombgColor()
            self.letA.textColor = self.randomColor()
            self.letA.layer.backgroundColor = self.randombgColor()
            self.letM.textColor = self.randomColor()
            self.letM.layer.backgroundColor = self.randombgColor()
            self.letB.textColor = self.randomColor()
            self.letB.layer.backgroundColor = self.randombgColor()
            self.letD.textColor = self.randomColor()
            self.letD.layer.backgroundColor = self.randombgColor()
            self.letA2.textColor = self.randomColor()
            self.letA2.layer.backgroundColor = self.randombgColor()
        }
        
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2.5) {
                self.letL.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...4))
                self.letA.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...4))
                self.letM.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...4))
                self.letB.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...4))
                self.letD.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...4))
                self.letA2.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...4))

            }

            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                self.letL.center = CGPoint(x: CGFloat.random(in: 1...300), y: CGFloat.random(in: 1...600))
                self.letA.center = CGPoint(x: CGFloat.random(in: 1...300), y: CGFloat.random(in: 1...600))
                self.letM.center = CGPoint(x: CGFloat.random(in: 1...300), y: CGFloat.random(in: 1...600))
                self.letB.center = CGPoint(x: CGFloat.random(in: 1...300), y: CGFloat.random(in: 1...600))
                self.letD.center = CGPoint(x: CGFloat.random(in: 1...300), y: CGFloat.random(in: 1...600))
                self.letA2.center = CGPoint(x: CGFloat.random(in: 1...300), y: CGFloat.random(in: 1...600))
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 3) {
             /*
                self.letL.textColor = self.randomColor()
                self.letL.backgroundColor = self.randomColor()
                self.letA.textColor = self.randomColor()
                self.letA.backgroundColor = self.randomColor()
                self.letM.textColor = self.randomColor()
                self.letM.backgroundColor = self.randomColor()
                self.letB.textColor = self.randomColor()
                self.letB.backgroundColor = self.randomColor()
                self.letD.textColor = self.randomColor()
                self.letD.backgroundColor = self.randomColor()
                self.letA2.textColor = self.randomColor()
                self.letA2.backgroundColor = self.randomColor()
                */
            }
        }, completion: nil)
        
        isToggled = true
        
    }
    
    func returnToNormal() {
        
        guard let spotL = startPointL, let spotA = startPointA, let spotM = startPointM, let spotB = startPointB, let spotD = startPointD, let spotA2 = startPointA2 else {return}
        
        UIView.animate(withDuration: 2.0, animations: {
            
            self.lambdaSign.alpha = 1
            self.letL.transform = .identity
            self.letL.center = spotL
            self.letA.transform = .identity
            self.letA.center = spotA
            self.letM.transform = .identity
            self.letM.center = spotM
            self.letB.transform = .identity
            self.letB.center = spotB
            self.letD.transform = .identity
            self.letD.center = spotD
            self.letA2.transform = .identity
            self.letA2.center = spotA2
            self.letL.textColor = .black
            self.letL.backgroundColor = .clear
            self.letA.textColor = .black
            self.letA.backgroundColor = .clear
            self.letM.textColor = .black
            self.letM.backgroundColor = .clear
            self.letB.textColor = .black
            self.letB.backgroundColor = .clear
            self.letD.textColor = .black
            self.letD.backgroundColor = .clear
            self.letA2.textColor = .black
            self.letA2.backgroundColor = .clear
        })
        
        isToggled = false
        
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
    
    func randombgColor() -> CGColor {
        return CGColor(srgbRed: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    func addSubviews() {
        
        let splitSections = (self.view.frame.maxX / 6)
        let middleSection = splitSections/2
        
        letL.center.x = middleSection
        letA.center.x = middleSection + splitSections
        letM.center.x = middleSection + (splitSections * 2)
        letB.center.x = middleSection + (splitSections * 3)
        letD.center.x = middleSection + (splitSections * 4)
        letA2.center.x = middleSection + (splitSections * 5)
        
        startPointL = CGPoint(x: letL.center.x, y: letL.center.y)
        startPointA = CGPoint(x: letA.center.x , y: letA.center.y)
        startPointM = CGPoint(x: letM.center.x, y: letM.center.y)
        startPointB = CGPoint(x: letB.center.x, y: letB.center.y)
        startPointD = CGPoint(x: letD.center.x, y: letD.center.y)
        startPointA2 = CGPoint(x: letA2.center.x, y: letA2.center.y)
        
    }
    

}
