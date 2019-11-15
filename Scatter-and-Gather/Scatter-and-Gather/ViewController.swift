//
//  ViewController.swift
//  Scatter-and-Gather
//
//  Created by Lambda_School_Loaner_201 on 11/14/19.
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered = false
    var labels: [UILabel] = []
    
    @IBOutlet weak var letterLLabel: UILabel!
    
    @IBOutlet weak var letter1ALabel: UILabel!
    
    @IBOutlet weak var letterMLabel: UILabel!
    
    @IBOutlet weak var letterBLabel: UILabel!
    
    @IBOutlet weak var letterDLabel: UILabel!
    
    @IBOutlet weak var letter2ALabel: UILabel!
    
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    
    
    
    
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        if isScattered {
            gatherAnimation()
            fadeLogo()
            
        }else {
            scatterAnimation()
            fadeLogo()
        }
        
        isScattered = !isScattered
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Function to Gather Animation:
    
    func gatherAnimation() {
        let labels: [UILabel] = [letterLLabel, letter1ALabel, letterMLabel, letterBLabel, letterDLabel, letter2ALabel]
        
        for i in labels {
            animate(label: i)
        }
    }
    
    //Function to Scatter animation:
    
    func scatterAnimation() {
        let labels: [UILabel] = [letterLLabel, letter1ALabel, letterMLabel, letterBLabel, letterDLabel, letter2ALabel]
        
        for i in labels {
            animate(label: i)
        }
    }

    //Function to Fade Lambda Logo:
    
    func fadeLogo() {
        UIView.animateKeyframes(withDuration: 4, delay: 0,options: [], animations: {

             UIView.addKeyframe(withRelativeStartTime: 0.1,
                               relativeDuration: 0.4) {
                                self.lambdaLogoImageView.alpha = 0
            }

             UIView.addKeyframe(withRelativeStartTime: 0.25,
                               relativeDuration: 0.4) {
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

      // MARK: Reset

         func reset(label: UILabel) {
             UIView.animate(withDuration: 4, animations: {
             label.transform = .identity
             label.layer.backgroundColor = UIColor.clear.cgColor
             label.textColor = UIColor.yellow
            label.transform = .identity
             }, completion: nil)
         }

      // MARK: Random Color
     extension UIColor {
        
                      static func random() -> UIColor {
                         let red = CGFloat.random(in: 0...255)
                         let green = CGFloat.random(in: 0...255)
                         let blue = CGFloat.random(in:0...255)
                         let alpha = CGFloat.random(in: 0.5...1)
                        
                         let color = UIColor(displayP3Red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
                         return color
                     }
             }



