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
        //  let letters = [one, two, three, four, five, six]
        
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        if isScattered == true {
            
            UIView.animateKeyframes(withDuration: 3, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.textColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.transform = CGAffineTransform(rotationAngle: .random())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.transform = CGAffineTransform(translationX: .random() * 200 , y: .random() * 400)
                               }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.textColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.transform = CGAffineTransform(rotationAngle: .random())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                self.two.transform = CGAffineTransform(translationX: .random() * 200 , y: .random() * 400)
                           }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.textColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.transform = CGAffineTransform(rotationAngle: .random())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                self.three.transform = CGAffineTransform(translationX: .random() * 200 , y: .random() * 400)
                           }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.textColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.transform = CGAffineTransform(rotationAngle: .random())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                self.four.transform = CGAffineTransform(translationX: .random() * 200 , y: .random() * 400)
                           }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.textColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.transform = CGAffineTransform(rotationAngle: .random())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                self.five.transform = CGAffineTransform(translationX: .random() * 200 , y: .random() * 400)
                           }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.textColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.transform = CGAffineTransform(rotationAngle: .random())
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                self.six.transform = CGAffineTransform(translationX: .random() * 200 , y: .random() * 400)
                           }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.backgroundColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.backgroundColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.backgroundColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.backgroundColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.backgroundColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.backgroundColor = .random()
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.logo.alpha = 0
                }
            }, completion: nil)
            isScattered = false
        } else if isScattered == false {
            UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.two.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.four.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.textColor = .black
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.six.backgroundColor = .white
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                                   self.logo.alpha = 1
                               }
                
            }, completion: nil)
            isScattered = true
        }
        
    }
    
    
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}

