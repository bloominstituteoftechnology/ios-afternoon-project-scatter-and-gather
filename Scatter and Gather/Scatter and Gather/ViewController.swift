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
    
    var isScattered: Bool = false
    
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
                self.two.textColor = .random()
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                self.three.textColor = .random()
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                self.four.textColor = .random()
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                self.five.textColor = .random()
            }
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                self.six.textColor = .random()
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
        }, completion: nil)
            isScattered = false
        } else if isScattered == false {
            UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.one.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                                  self.two.transform = .identity
                              }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.three.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                                  self.four.transform = .identity
                              }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                    self.five.transform = .identity
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 3) {
                                   self.six.transform = .identity
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

