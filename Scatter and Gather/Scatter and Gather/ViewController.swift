//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Morgan Smith on 4/10/20.
//  Copyright © 2020 Morgan Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var one: UILabel!
    
    @IBOutlet weak var two: UILabel!
    
    @IBOutlet weak var three: UILabel!
    
    @IBOutlet weak var four: UILabel!
    
    @IBOutlet weak var five: UILabel!
    
    @IBOutlet weak var six: UILabel!
    
    @IBOutlet weak var logo: UIImageView!
    
    var isScattered: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        if isScattered == true {
            
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.textColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.transform = CGAffineTransform(rotationAngle: .randomAngle())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.transform = CGAffineTransform(translationX: .randomInt() * 0.5, y: .randomInt())
                               }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.textColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.transform = CGAffineTransform(rotationAngle: .randomAngle())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.transform = CGAffineTransform(translationX: .randomInt() * 0.5, y: .randomInt())
                           }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.textColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.transform = CGAffineTransform(rotationAngle: .randomAngle())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.transform = CGAffineTransform(translationX: .randomInt() * 0.5, y: .randomInt())
                           }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.textColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.transform = CGAffineTransform(rotationAngle: .randomAngle())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.transform = CGAffineTransform(translationX: .randomInt() * 0.5, y: .randomInt())
                           }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.textColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.transform = CGAffineTransform(rotationAngle: .randomAngle())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.transform = CGAffineTransform(translationX: .randomInt() * 0.5, y: .randomInt())
                           }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.textColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.transform = CGAffineTransform(rotationAngle: .randomAngle())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.transform = CGAffineTransform(translationX: .randomInt() * 0.5, y: .randomInt())
                           }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.backgroundColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.backgroundColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.backgroundColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.backgroundColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.backgroundColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.backgroundColor = .randomColor()
                }
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 3) {
                    self.logo.alpha = 0
                }
            }, completion: nil)
            isScattered = false
        } else if isScattered == false {
            UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 3) {
                    self.one.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 3) {
                    self.two.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 3) {
                    self.three.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 3) {
                    self.four.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 3) {
                    self.five.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 3) {
                    self.five.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 3) {
                    self.six.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 3) {
                                   self.logo.alpha = 1
                               }
                
            }, completion: nil)
            isScattered = true
        }
        
    }
    
    
    
}

extension CGFloat {
    static func randomAngle() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat.random(in: 1...10)
    }
    
   static func randomInt() -> CGFloat {
        return CGFloat.random(in: 1...500)
    }
    
    static func randomIntColor() -> CGFloat {
        return CGFloat.random(in: 0...1)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(
            red:   .randomIntColor(),
            green: .randomIntColor(),
            blue:  .randomIntColor(),
            alpha: 1.0
        )
    }
}

