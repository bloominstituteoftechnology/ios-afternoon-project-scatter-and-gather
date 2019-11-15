//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Craig Swanson on 11/14/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var isScattered: Bool = false
    let animationDuration = 3.5
    var letterStartPoint: [CGPoint] = []
    var letterList: [UILabel] = []
    var lStart: CGPoint = CGPoint()
    var aStart: CGPoint = CGPoint()
    var mStart: CGPoint = CGPoint()
    var bStart: CGPoint = CGPoint()
    var dStart: CGPoint = CGPoint()
    var a2Start: CGPoint = CGPoint()
    
    
    // MARK: - Outlets
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    @IBOutlet weak var lambaLogo: UIImageView!
    

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func togglebuttonPressed(_ sender: UIBarButtonItem) {
        letterList = [letterL, letterA, letterM, letterB, letterD, letterA2]
        if isScattered {
            gatherAnimation()
            isScattered = false
        } else {
            letterStartPoint = [letterL.center, letterA.center, letterM.center, letterB.center, letterD.center, letterA2.center]
            scatterAnimation()
            isScattered = true
        }
    }
    
    
    private func scatterAnimation() {
        UIView.animate(withDuration: animationDuration) {
            self.lambaLogo.alpha = 0.0
        }
        let animationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                self.letterL.transform = CGAffineTransform(rotationAngle: CGFloat.pi*0.75)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                for letter in self.letterList {
                    letter.center = CGPoint(x: self.view.center.x + CGFloat.random(in: -250...150), y: self.view.center.y + CGFloat.random(in: -450...200))
                }
//                self.letterL.center = CGPoint(x: self.view.center.x + CGFloat.random(in: -200...(-100)), y: self.view.center.y + CGFloat.random(in: -450...(200)))
            }
        }
        
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: [], animations: animationBlock, completion: nil)
    }
    
    private func gatherAnimation() {
        UIView.animate(withDuration: animationDuration) {
            self.lambaLogo.alpha = 1.0
        }
        UIView.animate(withDuration: animationDuration) {
            self.letterL.transform = .identity
        }
        UIView.animate(withDuration: animationDuration) {
            self.letterL.center = self.letterStartPoint[0]
            self.letterA.center = self.letterStartPoint[1]
            self.letterM.center = self.letterStartPoint[2]
            self.letterB.center = self.letterStartPoint[3]
            self.letterD.center = self.letterStartPoint[4]
            self.letterA2.center = self.letterStartPoint[5]
        }
    }

}

// Just a test to see it animate.  Cool!!
//        UIView.animate(withDuration: 4.0, animations:  {
//            self.lambaLogo.transform = CGAffineTransform(rotationAngle: CGFloat.pi) }) { _ in
//                UIView.animate(withDuration: 1.0) {
//                    self.lambaLogo.transform = .identity
//                }
//
//        }
