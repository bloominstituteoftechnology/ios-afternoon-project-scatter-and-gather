//
//  ViewController.swift
//  LambdaAnimate
//
//  Created by Jeffrey Carpenter on 5/15/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var shouldScramble = true
    private var animateDuration = Double()
    private var labelCenters = [CGPoint]()
    private var labels = [UILabel]()

    @IBOutlet weak var lambdaLogo: UIImageView!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var firstALabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var lastALabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labels = [lLabel, firstALabel, mLabel, bLabel, dLabel, lastALabel]
        getCenters()
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        animateDuration = Double.random(in: 2...4)
        
        if shouldScramble {
            UIView.animate(withDuration: animateDuration) {
                for label in self.labels {
                    self.scatterLetter(label)
                    self.randomizeLabelColors(label)
                }
                self.lambdaLogo.alpha = 0
            }
        } else {
            UIView.animate(withDuration: animateDuration) {
                for label in self.labels {
                    self.revertToOriginal(for: label)
                }
                self.lambdaLogo.alpha = 1.0
            }
        }
        
        shouldScramble.toggle()
    }
    
    private func scatterLetter(_ letter: UILabel) {
        let labelHeight = Int(letter.bounds.height)
        let yMax = Int(view.frame.height) - labelHeight
        let xMax = Int(view.frame.width) - labelHeight
        
        letter.center = CGPoint.random(inX: labelHeight...xMax, inY: labelHeight...yMax)
        letter.transform = CGAffineTransform(rotationAngle: .randomAngle)
    }
    
    private func revertToOriginal(for label: UILabel) {
        label.layer.backgroundColor = UIColor.clear.cgColor
        label.textColor = .black
        label.transform = .identity
        label.center = labelCenters[label.tag]
    }
    
    private func randomizeLabelColors(_ label: UILabel) {
        label.layer.backgroundColor = UIColor.random.cgColor
        label.textColor = .random
    }
    
    private func getCenters() {
        for label in labels {
            labelCenters.append(label.center)
        }
    }
}

