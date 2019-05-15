//
//  ViewController.swift
//  LambdaAnimate
//
//  Created by Jeffrey Carpenter on 5/15/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shouldScramble = true

    @IBOutlet weak var lambdaLogo: UIImageView!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var firstALabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var lastALabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        if shouldScramble {
            scramble()
        } else {
            gather()
        }
        
        shouldScramble.toggle()
    }
    
    private func scramble() {
        
        // Scatter the letters
        
        // Randomize the letters colors
        randomizeLabel(lLabel)
        randomizeLabel(firstALabel)
        randomizeLabel(mLabel)
        randomizeLabel(bLabel)
        randomizeLabel(dLabel)
        randomizeLabel(lastALabel)
        
        // Hide the logo
    }
    
    private func gather() {
        
        // Gather the letters
        
        // Revert the letter colors to original
        revertToOriginal(for: lLabel)
        revertToOriginal(for: firstALabel)
        revertToOriginal(for: mLabel)
        revertToOriginal(for: bLabel)
        revertToOriginal(for: dLabel)
        revertToOriginal(for: lastALabel)
        
        // Show the logo
    }
    
    private func revertToOriginal(for label: UILabel) {
        label.backgroundColor = .clear
        label.textColor = .black
    }
    
    private func randomizeLabel(_ label: UILabel) {
        label.backgroundColor = randomColor()
        label.textColor = randomColor()
    }
    
    private func randomColor() -> UIColor {
        return UIColor(red:  CGFloat.random(in: 1...255) / 255, green: CGFloat.random(in: 1...255) / 255, blue: CGFloat.random(in: 1...255) / 255, alpha: 1)
    }
}

