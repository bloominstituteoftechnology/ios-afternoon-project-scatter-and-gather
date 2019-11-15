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
        if isScattered {
            gatherAnimation()
            isScattered = false
        } else {
            lStart = self.letterL.center
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
                self.letterL.center = CGPoint(x: self.view.center.x - 18, y: self.view.center.y - 22)
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
            self.letterL.center = self.lStart
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
