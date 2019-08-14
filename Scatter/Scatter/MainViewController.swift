//
//  ViewController.swift
//  Scatter
//
//  Created by Nathan Hedgeman on 8/14/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //Properties
    
    var animationTime: Double = 1
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    
    var isPressed: Bool = false

}

extension MainViewController {
    
    func scatter() {
        
    }
    
    func gather() {
        
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        if isPressed {
            
            gather()
            
        } else {
            
            scatter()
            
        }
        
        isPressed = !isPressed
    }
    
    func animate(label: UILabel) {
        
        
        let colors: [UIColor] = [.red, .blue, .white, .gray, .lightGray, .orange, .black, .purple, .cyan, .magenta, .brown, .clear, .darkGray, .green, .yellow]
        
        
        //Logo alpha
        UIView.animate(withDuration: 0.5, animations: {
            self.logo.alpha = 0
        }, completion: nil)
        
        //Background Color
        UILabel.animate(withDuration: animationTime, animations: {
            label.layer.backgroundColor = UIColor.random(from: colors)?.cgColor
        }, completion: nil)
        
        //Rotation And Position
        UILabel.animate(withDuration: animationTime) {
            label.transform = CGAffineTransform(rotationAngle: .random(in: 0...10))
                .concatenating(CGAffineTransform(translationX: CGFloat.random(in: -50...50), y: CGFloat.random(in: -150...400)))
            
        }
}


