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
    
    // I don't know where to find the information on fading something..
    // alpha 1.0 - 0.0 ( fade out )
    private func fadeLogo() {
        UIView.animate(withDuration: 4.0, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.imageView.alpha = 0.0
        }, completion: nil)
        
        // addSubview(imageView)
    }
    
    private func lettersRandom() {
        
        UIView.animateKeyframes(withDuration: 4.0, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelL.transform = CGAffineTransform(translationX: 0, y: 20)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelA.transform = CGAffineTransform(translationX: 10, y: 40)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelM.transform = CGAffineTransform(translationX: 50, y: 100)
                self.labelM.transform = CGAffineTransform(rotationAngle: .pi/0.8)
                self.labelM.backgroundColor = UIColor(red: .random(in: 0...255), green: .random(in: 0...255), blue: .random(in: 0...255), alpha: 1.0)
                self.labelM.textColor = UIColor(red: .random(in: 0...255), green: .random(in: 0...255), blue: .random(in: 0...255), alpha: 1.0)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelD.transform = CGAffineTransform(translationX: 45, y: 60)
                self.labelD.backgroundColor = UIColor(red: .random(in: 0...255), green: .random(in: 0...255), blue: .random(in: 0...255), alpha: 1.0)
                self.labelD.textColor = UIColor(red: .random(in: 0...255), green: .random(in: 0...255), blue: .random(in: 0...255), alpha: 1.0)
                self.labelD.transform = CGAffineTransform(rotationAngle: .pi/16.0)
            }
            
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.labelA2.transform = CGAffineTransform(translationX: 15, y: 70)
                self.labelA2.backgroundColor = UIColor(red: .random(in: 0...255), green: .random(in: 0...255), blue: .random(in: 0...255), alpha: 1.0)
                self.labelA2.textColor = UIColor(red: .random(in: 0...255), green: .random(in: 0...255), blue: .random(in: 0...255), alpha: 1.0)
                self.labelA2.transform = CGAffineTransform(rotationAngle: .pi/4)
            }
            
            
        }, completion: nil)
        
    }
    
}
