//
//  ViewController.swift
//  BasicAnimation-Scatter-and-Gather
//
//  Created by Jonalynn Masters on 10/8/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// MARK: Properties
    
    var isScattered = false
    var labels: [UILabel] = []
    
// MARK: Outlets
    
    @IBOutlet var lLabel: UILabel!
    @IBOutlet var firstALabel: UILabel!
    @IBOutlet var mLabel: UILabel!
   
    @IBOutlet var bLabel: UILabel!
    @IBOutlet var dLabel: UILabel!
    @IBOutlet var secondALabel: UILabel!
    
    @IBOutlet var lambdaLogoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
// MARK: Actions
    
    // isScattered = boolean that can be toggled
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
            if isScattered {
                gatherAnimation()
                UIView.animate(withDuration: 4, animations: {
                    self.lambdaLogoImageView.alpha = 1
                }, completion: nil)
            } else {
                scatterAnimation()
                UIView.animate(withDuration: 0.5, animations: {
                    self.lambdaLogoImageView.alpha = 0
                }, completion: nil)
            }
            isScattered = !isScattered
        }
    
        func gatherAnimation() {
        let labels: [UILabel] = [lLabel, firstALabel, mLabel, bLabel, dLabel, secondALabel]
        
        for i in labels {
            reset(label: i)
        }
    }
    
    func scatterAnimation() {
        let labels: [UILabel] = [lLabel, firstALabel, mLabel, bLabel, dLabel, secondALabel]
        for i in labels {
            animate(label: i)
        }
    }
    
    func fadeLogo() {
        UIView.animateKeyframes(withDuration: 4, delay: 0,options: [], animations: {
           
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 2) {
                                self.lambdaLogoImageView.alpha = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 2,
                               relativeDuration: 2) {
                                self.lambdaLogoImageView.alpha = 1
            }
        },
        completion: nil)
}
    
    func animate(label: UILabel) {
            
            //Background Color
            UILabel.animate(withDuration: 4, animations: {
                label.layer.backgroundColor = UIColor.random().cgColor
            }, completion: nil)
        
            //Rotation And Position
            UILabel.animate(withDuration: 4) {
                label.transform = CGAffineTransform(rotationAngle: .random(in: 0...10))
                    .concatenating(CGAffineTransform(translationX: CGFloat.random(in: -250...300), y: CGFloat.random(in: -300...400)))
            }
            
            //Text Color
            UILabel.animate(withDuration: 4, animations: {
                label.textColor = UIColor.random()
            }, completion: nil)
        }
    }
        func reset(label: UILabel) {
            UIView.animate(withDuration: 4, animations: {
                label.transform = .identity
                label.layer.backgroundColor = UIColor.clear.cgColor
                label.textColor = UIColor.yellow
            }, completion: nil)
        }
            
            extension UIColor {

                static func random() -> UIColor {
                    let hue = CGFloat.random(in: 0...1)
                    let saturation = CGFloat.random(in: 0.2...1)
                    let brightness = CGFloat.random(in: 0.2...1)
                    let alpha = CGFloat.random(in: 0.5...1)
                    
                    let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
                    
                    return color
                }
        }


