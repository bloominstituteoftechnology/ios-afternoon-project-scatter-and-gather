//
//  ScatterAndGatherViewController.swift
//  ScatterAndGather
//
//  Created by Jesse Ruiz on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ScatterAndGatherViewController: UIViewController {
    
    var isScattered: Bool = false
    
    
    // MARK: - Outlets
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        if isScattered {
            
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                
                // LOGO REAPPEAR
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.lambdaLogo.alpha = 1.0
                }
                
                // LETTERS GOING BACK TO PLACE
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterL.frame = CGRect(x: 20, y: 108, width: 23, height: 48)
                    self.letterA.frame = CGRect(x: 58, y: 108, width: 30, height: 48)
                    self.letterM.frame = CGRect(x: 104, y: 108, width: 36, height: 48)
                    self.letterB.frame = CGRect(x: 156, y: 108, width: 27, height: 48)
                    self.letterD.frame = CGRect(x: 199, y: 108, width: 29, height: 48)
                    self.letterA2.frame = CGRect(x: 244, y: 108, width: 30, height: 48)
                    
                    self.letterL.textColor = .black
                    self.letterA.textColor = .black
                    self.letterM.textColor = .black
                    self.letterB.textColor = .black
                    self.letterD.textColor = .black
                    self.letterA2.textColor = .black
                    
                    self.letterL.backgroundColor = .white
                    self.letterA.backgroundColor = .white
                    self.letterM.backgroundColor = .white
                    self.letterB.backgroundColor = .white
                    self.letterD.backgroundColor = .white
                    self.letterA2.backgroundColor = .white
                }
                
            }, completion: nil)
            
        } else {
            
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                
                // LOGO DISAPPEAR
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.lambdaLogo.alpha = 0.0
                }
                
                // LETTERS DISPERSING
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterL.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                     green: CGFloat.random(in: 0...255)/255,
                                                     blue: CGFloat.random(in: 0...255)/255,
                                                     alpha: 1.0)
                    
                    self.letterL.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                           green: CGFloat.random(in: 0...255)/255,
                                                           blue: CGFloat.random(in: 0...255)/255,
                                                           alpha: 1.0)
                    
                    self.letterL.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterL.frame = CGRect(x: Int.random(in: 100...400),
                                                y: Int.random(in: 100...800),
                                                width: Int.random(in: 40...50),
                                                height: Int.random(in: 40...50))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterA.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                     green: CGFloat.random(in: 0...255)/255,
                                                     blue: CGFloat.random(in: 0...255)/255,
                                                     alpha: 1.0)
                    
                    self.letterA.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                           green: CGFloat.random(in: 0...255)/255,
                                                           blue: CGFloat.random(in: 0...255)/255,
                                                           alpha: 1.0)
                    
                    self.letterA.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterA.frame = CGRect(x: Int.random(in: 100...400),
                                                y: Int.random(in: 100...800),
                                                width: Int.random(in: 40...50),
                                                height: Int.random(in: 40...50))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterM.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                     green: CGFloat.random(in: 0...255)/255,
                                                     blue: CGFloat.random(in: 0...255)/255,
                                                     alpha: 1.0)
                    
                    self.letterM.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                           green: CGFloat.random(in: 0...255)/255,
                                                           blue: CGFloat.random(in: 0...255)/255,
                                                           alpha: 1.0)
                    
                    self.letterM.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterM.frame = CGRect(x: Int.random(in: 100...400),
                                                y: Int.random(in: 100...800),
                                                width: Int.random(in: 40...50),
                                                height: Int.random(in: 40...50))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterB.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                     green: CGFloat.random(in: 0...255)/255,
                                                     blue: CGFloat.random(in: 0...255)/255,
                                                     alpha: 1.0)
                    
                    self.letterB.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                           green: CGFloat.random(in: 0...255)/255,
                                                           blue: CGFloat.random(in: 0...255)/255,
                                                           alpha: 1.0)
                    
                    self.letterB.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterB.frame = CGRect(x: Int.random(in: 100...400),
                                                y: Int.random(in: 100...800),
                                                width: Int.random(in: 40...50),
                                                height: Int.random(in: 40...50))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterD.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                     green: CGFloat.random(in: 0...255)/255,
                                                     blue: CGFloat.random(in: 0...255)/255,
                                                     alpha: 1.0)
                    
                    self.letterD.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                           green: CGFloat.random(in: 0...255)/255,
                                                           blue: CGFloat.random(in: 0...255)/255,
                                                           alpha: 1.0)
                    
                    self.letterD.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterD.frame = CGRect(x: Int.random(in: 100...400),
                                                y: Int.random(in: 100...800),
                                                width: Int.random(in: 40...50),
                                                height: Int.random(in: 40...50))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.letterA2.textColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                      green: CGFloat.random(in: 0...255)/255,
                                                      blue: CGFloat.random(in: 0...255)/255,
                                                      alpha: 1.0)
                    
                    self.letterA2.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255,
                                                            green: CGFloat.random(in: 0...255)/255,
                                                            blue: CGFloat.random(in: 0...255)/255,
                                                            alpha: 1.0)
                    
                    self.letterA2.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 180)
                    
                    self.letterA2.frame = CGRect(x: Int.random(in: 100...400),
                                                 y: Int.random(in: 100...800),
                                                 width: Int.random(in: 40...50),
                                                 height: Int.random(in: 40...50))
                }
                
            }, completion: nil)
            
        }
        isScattered.toggle()
    }
    
    
}
