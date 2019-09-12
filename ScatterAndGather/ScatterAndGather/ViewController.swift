//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Ciara Beitel on 9/10/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool = false
    var lambdaLetters: [UILabel] = []
    let image: Image = Image(name: "lambda_logo")
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var lambdaLogoImage: UIImageView!
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        scatterOrGather()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lambdaLetters.append(contentsOf: [lLabel, aLabel, mLabel, bLabel, dLabel, a2Label])
        lambdaLogoImage.image = image.image
    }
    
    func scatterOrGather() {
        UIView.animate(withDuration: 2) {
            if self.isScattered {
                self.lLabel.transform = .identity
                self.lLabel.center = CGPoint(x: 30, y: 30)
                self.aLabel.transform = .identity
                self.aLabel.center = CGPoint(x: 80, y: 30)
                self.mLabel.transform = .identity
                self.mLabel.center = CGPoint(x: 135, y: 30)
                self.bLabel.transform = .identity
                self.bLabel.center = CGPoint(x: 195, y: 30)
                self.dLabel.transform = .identity
                self.dLabel.center = CGPoint(x: 250, y: 30)
                self.a2Label.transform = .identity
                self.a2Label.center = CGPoint(x: 300, y: 30)
                self.lambdaLogoImage.alpha = 1
                self.isScattered = false
            } else {
                self.lLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2).concatenating(CGAffineTransform(scaleX: 2, y: 2))
                self.lLabel.center = CGPoint(x: 300, y: 600)
                self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 3)
                self.aLabel.center = CGPoint(x: 40, y: 100)
                self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
                .concatenating(CGAffineTransform(scaleX: 2, y: 2))
                self.mLabel.center = CGPoint(x: 150, y: 450)
                self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 5)
                self.bLabel.center = CGPoint(x: 330, y: 200)
                self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6)
                .concatenating(CGAffineTransform(scaleX: 2, y: 2))
                self.dLabel.center = CGPoint(x: 100, y: 60)
                self.a2Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 7)
                self.a2Label.center = CGPoint(x: 50, y: 500)
                self.lambdaLogoImage.alpha = 0
                self.isScattered = true
            }
        }
    }
}
