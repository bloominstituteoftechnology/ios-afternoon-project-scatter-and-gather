//
//  AnimationsViewController.swift
//  ScatterAndGatherAnimations
//
//  Created by Michael on 1/21/20.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {

    var isScattered: Bool = false
    
//    var originalLPosition: CGPoint?
//    var originalAPosition: CGPoint?
//    var originalMPosition: CGPoint?
//    var originalBPosition: CGPoint?
//    var originalDPosition: CGPoint?
//    var originalA2Position: CGPoint?
    
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    @IBOutlet var labels: [UILabel]!
       
    @IBOutlet weak var labelL: UILabel!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelM: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelD: UILabel!
    @IBOutlet weak var labelA2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        isScattered.toggle()
        
        if isScattered {
            scatterAnimations()
        } else {
            gatherAnimations()
        }
    }
    
    func updateViews() {
        lambdaLogoImageView.image = UIImage(named: "lambda_logo")
    }
    
//    func scatterAnimations() {
//        guard
//            let labelL = labelL,
//            let labelA = labelA,
//            let labelM = labelM,
//            let labelB = labelB,
//            let labelD = labelD,
//            let labelA2 = labelA2
//            else { return }
//
//        let labelArray = [labelL, labelA, labelM, labelB, labelD, labelA2]
//
//        UIView.animate(withDuration: 4.0, delay: 0, options: .curveEaseOut, animations: {
//            self.lambdaLogoImageView.alpha = 0
//        }, completion: nil)
//
//        UIView.animate(withDuration: 4.0) {
//            for label in labelArray {
//                label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: -8...8))
//                label.center = CGPoint(x: self.view.center.x + CGFloat.random(in: -186...186), y: self.view.center.y + CGFloat.random(in: -350...403))
//                label.textColor = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
//                label.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
//            }
//        }
//    }
    
    func scatterAnimations() {
        guard
            let labelL = labelL,
            let labelA = labelA,
            let labelM = labelM,
            let labelB = labelB,
            let labelD = labelD,
            let labelA2 = labelA2
            else { return }
        
        let labelArray = [labelL, labelA, labelM, labelB, labelD, labelA2]
        
        let animationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.lambdaLogoImageView.alpha = 0
                for label in labelArray {
                    label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: -8...8))
                    label.center = CGPoint(x: self.view.center.x + CGFloat.random(in: -186...186), y: self.view.center.y + CGFloat.random(in: -350...403))
                    
                }
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1.0) {
                for label in labelArray {
                    label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: -8...8))
                    label.center = CGPoint(x: self.view.center.x + CGFloat.random(in: -186...186), y: self.view.center.y + CGFloat.random(in: -350...403))
                }
            }
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                for label in labelArray {
                    label.textColor = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
                    label.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
                }
            }
        }
        
        UIView.animateKeyframes(withDuration: 4.0, delay: 0.0, options: [], animations: animationBlock)
        
    }
        
    func gatherAnimations() {
        guard
            let labelL = labelL,
            let labelA = labelA,
            let labelM = labelM,
            let labelB = labelB,
            let labelD = labelD,
            let labelA2 = labelA2
            else { return }
        
        let labelArray = [labelL, labelA, labelM, labelB, labelD, labelA2]
        
        UIView.animate(withDuration: 4.0) {
            self.lambdaLogoImageView.alpha = 1
            self.labelL.center = CGPoint(x: 50.5, y: 138.0)
            self.labelA.center = CGPoint(x: 108.5, y: 138.0)
            self.labelM.center = CGPoint(x: 180.0, y: 138.0)
            self.labelB.center = CGPoint(x: 246.0, y: 138.0)
            self.labelD.center = CGPoint(x: 299.5, y: 138.0)
            self.labelA2.center = CGPoint(x: 358.5, y: 138.0)
        }
        
        let animationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                for label in labelArray {
                    label.transform = .identity
                    label.backgroundColor = UIColor.white
                    label.textColor = UIColor.black
                }
            }
        }
        UIView.animateKeyframes(withDuration: 4.0, delay: 2.0, options: [], animations: animationBlock)
          
    }
    
    
//    func gatherAnimations() {
//        guard
//            let labelL = labelL,
//            let labelA = labelA,
//            let labelM = labelM,
//            let labelB = labelB,
//            let labelD = labelD,
//            let labelA2 = labelA2
//            else { return }
//
//        let labelArray = [labelL, labelA, labelM, labelB, labelD, labelA2]
//
//        UIView.animate(withDuration: 4.0, delay: 0, options: .curveEaseIn, animations: {
//            self.lambdaLogoImageView.alpha = 1
//        }, completion: nil)
//
//        UIView.animate(withDuration: 4.0) {
//            for label in labelArray {
//                label.transform = .identity
//                label.backgroundColor = UIColor.white
//                label.textColor = UIColor.black
//            }
//            self.labelL.center = CGPoint(x: 50.5, y: 138.0)
//            self.labelA.center = CGPoint(x: 108.5, y: 138.0)
//            self.labelM.center = CGPoint(x: 180.0, y: 138.0)
//            self.labelB.center = CGPoint(x: 246.0, y: 138.0)
//            self.labelD.center = CGPoint(x: 299.5, y: 138.0)
//            self.labelA2.center = CGPoint(x: 358.5, y: 138.0)
//        }
//    }
}
