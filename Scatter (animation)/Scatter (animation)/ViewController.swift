//
//  ViewController.swift
//  Scatter (animation)
//
//  Created by Nathan Hedgeman on 6/25/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    
    var isPressed: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        logoAnimation()
        
        if isPressed == false {
            
            labelSpread()
            
        } else {
            
            labelGather()
            
        }
        
        isPressed = !isPressed
    }
    
    
    
    //MARK: - Functions
    
    
    func labelSpread() {
        let labelArray: [UILabel] = [
            lLabel,
            aLabel,
            mLabel,
            bLabel,
            dLabel,
            a2Label,
        ]
        
        for x in labelArray {
            UILabel.animate(withDuration: 2) {
                x.center = CGPoint(x: CGFloat.random(in: 1...self.view.frame.width), y: CGFloat.random(in: 1...self.view.frame.height))
                x.backgroundColor = UIColor.random(from: [.red, .yellow, .orange, .green, .blue, .purple, .gray])
            }
        }
    }
    
    func labelGather() {
        let labelArray: [UILabel] = [
            lLabel,
            aLabel,
            mLabel,
            bLabel,
            dLabel,
            a2Label,
        ]
        
        UILabel.animate(withDuration: 0.5) {
            self.lLabel.center.x = 0
            self.aLabel.center.x = 38
            self.mLabel.center.x = 80
            self.bLabel.center.x = 120.5
            self.dLabel.center.x = 157
            self.a2Label.center.x = 190
        }
        
        for x in labelArray {
            UILabel.animate(withDuration: 0.5) {
                x.center.y = 0
                x.backgroundColor = .clear
            }
        }
    }
    
    func logoAnimation() {
        if logo.alpha == 0 {
            UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
                self.logo.alpha = 1
            }, completion: nil)
        } else {
            UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
                self.logo.alpha = 0
            }, completion: nil)
        }
    }
}

extension UIColor {
    static func random(from colors: [UIColor]) -> UIColor? {
        return colors.randomElement()
    }
}

