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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        setCenters()
    }

    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        animateDuration = Double.random(in: 2...4)
        
        if shouldScramble {
            scramble()
        } else {
            gather()
        }
        
        shouldScramble.toggle()
    }
    
    private func scramble() {
        
        UIView.animate(withDuration: animateDuration) {
            self.scatterLetter(self.lLabel)
            self.scatterLetter(self.firstALabel)
            self.scatterLetter(self.mLabel)
            self.scatterLetter(self.bLabel)
            self.scatterLetter(self.dLabel)
            self.scatterLetter(self.lastALabel)
            self.randomizeLabelColors(self.lLabel)
            self.randomizeLabelColors(self.firstALabel)
            self.randomizeLabelColors(self.mLabel)
            self.randomizeLabelColors(self.bLabel)
            self.randomizeLabelColors(self.dLabel)
            self.randomizeLabelColors(self.lastALabel)
            self.lambdaLogo.alpha = 0
        }
    }
    
    private func gather() {
        
        UIView.animate(withDuration: animateDuration) {
            self.revertToOriginal(for: self.lLabel)
            self.revertToOriginal(for: self.firstALabel)
            self.revertToOriginal(for: self.mLabel)
            self.revertToOriginal(for: self.bLabel)
            self.revertToOriginal(for: self.dLabel)
            self.revertToOriginal(for: self.lastALabel)
            self.lambdaLogo.alpha = 1.0
        }
    }
    
    private func scatterLetter(_ letter: UILabel) {
        letter.center = self.randomPoint()
        letter.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...360) * .pi / 180)
    }
    
    private func randomPoint() -> CGPoint {
        let yBounds = Int(view.frame.height) - 50
        let xBounds = Int(view.frame.width) - 50
        return CGPoint(x: Int.random(in: 50...xBounds), y: Int.random(in: 50...yBounds))
    }
    
    private func revertToOriginal(for label: UILabel) {
        label.layer.backgroundColor = UIColor.clear.cgColor
        label.textColor = .black
        label.transform = .identity
        label.center = labelCenters[label.tag]
    }
    
    private func randomizeLabelColors(_ label: UILabel) {
        label.layer.backgroundColor = UIColor.random().cgColor
        label.textColor = .random()
    }
    
    private func setCenters() {
        labelCenters.append(lLabel.center)
        labelCenters.append(firstALabel.center)
        labelCenters.append(mLabel.center)
        labelCenters.append(bLabel.center)
        labelCenters.append(dLabel.center)
        labelCenters.append(lastALabel.center)
    }
}

