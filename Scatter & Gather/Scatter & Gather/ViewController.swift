//
//  ViewController.swift
//  Scatter & Gather
//
//  Created by Mitchell Budge on 5/22/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(
        lLabel.center,
        firstaLabel.center,
        mLabel.center,
        bLabel.center,
        dLabel.center,
        secondaLabel.center)
        logoImageView.image = lambdaLogoImage
        labels += [lLabel, firstaLabel, mLabel, bLabel, dLabel, secondaLabel]
    }
    
    var isScattered: Bool = true
    let lOriginal = CGPoint(x: 50.0, y: 24.0)
    let a1Original = CGPoint(x: 100.0, y: 24.0)
    let mOriginal = CGPoint(x: 150.0, y: 24.0)
    let bOriginal = CGPoint(x: 200.0, y: 24.0)
    let dOriginal = CGPoint(x: 250.0, y: 24.0)
    let a2Original = CGPoint(x: 300.0, y: 24.0)
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        print(lLabel.center)
        if isScattered == true {
            scatterAnimation()
            isScattered = false
        } else if isScattered == false {
            gatherAnimation()
            isScattered = true
        }
    }
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var firstaLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var secondaLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    var lambdaLogoImage = UIImage(named: "lambda_logo")
    var labels : [UILabel] = []
    var colors : [UIColor] = [.red, .yellow, .blue, .orange, .green, .purple, .black, .brown]
 
    func scatterAnimation() {
        UIView.animate(withDuration: 4) {
            self.logoImageView.alpha = 0
            for label in self.labels {
                let randomX = Int.random(in: 50...300)
                let randomY = Int.random(in: -50...600)
                let randomPoint = CGPoint(x: randomX, y: randomY)
                let randomAngle = CGFloat.random(in: 0.0...360.0)
                label.center = randomPoint
                label.transform = CGAffineTransform(rotationAngle: randomAngle)
                label.backgroundColor = self.colors.randomElement()
                label.textColor = self.colors.randomElement()
            }
        }
    }
    
    func gatherAnimation() {
        logoImageView.alpha = 0
        UIView.animate(withDuration: 4) {
            self.logoImageView.alpha = 1
            for label in self.labels {
                label.transform = .identity
                label.backgroundColor = .white
                label.textColor = .black
            }
            self.lLabel.center = self.lOriginal
            self.firstaLabel.center = self.a1Original
            self.mLabel.center = self.mOriginal
            self.bLabel.center = self.bOriginal
            self.dLabel.center = self.dOriginal
            self.secondaLabel.center = self.a2Original
        }
    }
}

