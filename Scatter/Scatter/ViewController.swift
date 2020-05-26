//
//  ViewController.swift
//  Scatter
//
//  Created by Ian French on 5/24/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelL: UILabel!
    
    @IBOutlet weak var labelA: UILabel!
    
    @IBOutlet weak var labelM: UILabel!
    
    @IBOutlet weak var labelB: UILabel!
    
    @IBOutlet weak var labelD: UILabel!
    
    
    @IBOutlet weak var labelA2: UILabel!
    
    
    @IBOutlet weak var logoView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var isScattered: Bool = false
    
    
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        if isScattered {
            isScattered.toggle()
            gatherLetters()
            
            
            UIView.animate(withDuration: 2.0) {
                self.logoView.alpha = 1
            }
        }  else {
            isScattered.toggle()
            scatterLetters()
            
            UIView.animate(withDuration: 2.0) {
                self.logoView.alpha = 0
            }
            
        }
        
        
        
        
        
        
    }
    
    
    private func gatherLetters() {
        
        UIView.animate(withDuration: 2.0)  {
            self.labelL.transform = .identity
            self.labelL.textColor = .black
            self.labelA.transform = .identity
            self.labelA.textColor = .black
            self.labelM.transform = .identity
            self.labelM.textColor = .black
            self.labelB.transform = .identity
            self.labelB.textColor = .black
            self.labelD.transform = .identity
            self.labelD.textColor = .black
            self.labelA2.transform = .identity
            self.labelA2.textColor = .black
        }
        
    }
    
    func scatterLetters(){
        
        let scale = CGAffineTransform(scaleX: .random(in: -2...4), y: .random(in: -2...4))
        
        
        let animationL = {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0) {
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 2.5) {
                let translateL = CGAffineTransform(translationX: .random(in: -20...200), y: .random(in: -25...200))
                
                
                self.labelL.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...10)).concatenating(translateL).concatenating(scale)
            }
        }
        
        
        
        
        
        let animationA = {
            
            
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0) {
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 2.5) {
                let translateA = CGAffineTransform(translationX: .random(in: -50...180), y: .random(in: -25...200))
                
                self.labelA.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...10)).concatenating(translateA).concatenating(scale)
            }
            
        }
        let animationM = {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0) {
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 2.5) {
                let translateM = CGAffineTransform(translationX: .random(in: -60...150), y: .random(in: -25...200))
                 let scaleM = CGAffineTransform(scaleX: .random(in: 0...5), y: .random(in: 0...5))
                self.labelM.transform = CGAffineTransform(scaleX: .random(in: -10...50), y: .random(in: -10...50))
                self.labelM.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...10)).concatenating(translateM).concatenating(scaleM)
            }
        }
        let animationB = {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0) {
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 2.5) {
                let translateB = CGAffineTransform(translationX: .random(in: -100...100), y: .random(in: -25...200))
                
                self.labelB.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...10)).concatenating(translateB).concatenating(scale)
            }
        }
        let animationD = {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0) {
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 2.5) {
                let translateD = CGAffineTransform(translationX: .random(in: -150...80), y: .random(in: -25...200))
                 let scaleD = CGAffineTransform(scaleX: .random(in: 0...5), y: .random(in: 0...5))
                self.labelD.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...10)).concatenating(translateD).concatenating(scaleD)
            }
        }
        let animationA2 = {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0) {
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 2.5) {
                let translateA2 = CGAffineTransform(translationX: .random(in: -200...50), y: .random(in: -20...200))
                
                self.labelA2.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...10)).concatenating(translateA2).concatenating(scale)
                
            }
        }
        
        colorChanges(labelName: labelL)
        colorChanges(labelName: labelA)
        colorChanges(labelName: labelM)
        colorChanges(labelName: labelB)
        colorChanges(labelName: labelD)
        colorChanges(labelName: labelA2)
        
        
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: animationL, completion: nil)
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: animationA, completion: nil)
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: animationM, completion: nil)
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: animationB, completion: nil)
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: animationD, completion: nil)
        
        
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: animationA2, completion: nil)
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    func colorChanges(labelName: UILabel) {
        
        
        let label  = labelName
        
        let colorShift = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        
        colorShift.fromValue = label.layer.backgroundColor
        
        
        
        
        
        let letterColor = createRandomColor()
        
        label.textColor = UIColor( cgColor: letterColor)
        label.layer.borderColor = letterColor
        
        colorShift.toValue = letterColor
        colorShift.duration = 3.0
        colorShift.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        label.layer.add(colorShift, forKey: "backgroundColorChange")
        
    }
    
    
    
    private func createRandomColor() -> CGColor {
        let red = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        
        return UIColor (red: red/255 , green: green/255 , blue: blue/255, alpha: 1 ).cgColor
    }
    
    
    
    
    
    
    
    
    
}

