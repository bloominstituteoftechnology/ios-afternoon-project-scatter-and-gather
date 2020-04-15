//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Harmony Radley on 4/14/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class LambdaViewController: UIViewController {

    var isScattered: Bool = false
    
    @IBOutlet weak var labelL: UILabel!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelM: UILabel!
    @IBOutlet weak var labelD: UILabel!
    @IBOutlet weak var labelA2: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        fadeLogo()
        lettersRandom()
    }
    
    // alpha 1.0 - 0.0 ( fade out )
    private func fadeLogo() {
        UIView.animate(withDuration: 2.0, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.imageView.alpha = 0.0
        }, completion: nil)
        
        // fade in
        
        UIView.animate(withDuration: 2.0, delay: 2.0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.imageView.alpha = 1.0
        }, completion: nil)
    }
    
    private func lettersRandom() {
        
        UIView.animateKeyframes(withDuration: 4.0, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelL.transform = CGAffineTransform(translationX: CGFloat(Int.random(in: 1...100)), y: CGFloat(Int.random(in: 1...100)))
                self.labelL.transform = CGAffineTransform(rotationAngle: .pi/0.8)
                self.labelL.backgroundColor = UIColor(red: .random(in: 0/255...255/255), green: .random(in: 0/255...255/255), blue: .random(in: 0/255...255/255), alpha: 1.0)
                self.labelL.textColor = UIColor(red: .random(in: 0/255...255/255), green: .random(in: 0/255...255/255), blue: .random(in: 0/255...255/255), alpha: 1.0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.labelL.transform = .identity
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelA.transform = CGAffineTransform(translationX: CGFloat(Int.random(in: 1...100)), y: CGFloat(Int.random(in: 1...100)))
                self.labelA.transform = CGAffineTransform(rotationAngle: .pi/0.8)
                self.labelA.backgroundColor = UIColor(red: .random(in: 0/255...255/255), green: .random(in: 0...255), blue: .random(in: 0/255...255/255), alpha: 1.0)
                self.labelA.textColor = UIColor(red: .random(in: 0/255...255/255), green: .random(in: 0/255...255/255), blue: .random(in: 0/255...255/255), alpha: 1.0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.labelA.transform = .identity
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelM.transform = CGAffineTransform(translationX: CGFloat(Int.random(in: 1...100)), y: CGFloat(Int.random(in: 1...100)))
                self.labelM.transform = CGAffineTransform(rotationAngle: .pi/0.8)
                self.labelM.backgroundColor = UIColor(red: .random(in: 0...255), green: .random(in: 0/255...255/255), blue: .random(in: 0/255...255/255), alpha: 1.0)
                self.labelM.textColor = UIColor(red: .random(in: 0/255...255/255), green: .random(in: 0/255...255/255), blue: .random(in: 0/255...255/255), alpha: 1.0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.labelM.transform = .identity
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelD.transform = CGAffineTransform(translationX: CGFloat(Int.random(in: 1...100)), y: CGFloat(Int.random(in: 1...100)))
                self.labelD.backgroundColor = UIColor(red: .random(in: 0/255...255/255), green: .random(in: 0/255...255/255), blue: .random(in: 0/255...255/255), alpha: 1.0)
                self.labelD.textColor = UIColor(red: .random(in: 0/255...255/255), green: .random(in: 0/255...255/255), blue: .random(in: 0/255...255/255), alpha: 1.0)
                self.labelD.transform = CGAffineTransform(rotationAngle: .pi/16.0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.labelD.transform = .identity
            }
            
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelA2.transform = CGAffineTransform(translationX: 15, y: 70)
                self.labelA2.backgroundColor = UIColor(red: .random(in: 0/255...255/255), green: .random(in: 0/255...255/255), blue: .random(in: 0/255...255/255), alpha: 1.0)
                self.labelA2.textColor = UIColor(red: .random(in: 0/255...255/255), green: .random(in: 0/255...255/255), blue: .random(in: 0/255...255/255), alpha: 1.0)
                self.labelA2.transform = CGAffineTransform(rotationAngle: .pi/4)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.labelA2.transform = .identity
            }
            
            
        }, completion: nil)
        
    }
    
}
