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
   // @IBOutlet weak var toggle: UIBarButtonItem!
    
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered {
            isScattered.toggle()
            gatherLetters()
        } else {
            isScattered.toggle()
            scatterLetters()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lambdaLetters.append(contentsOf: [lLabel, aLabel, mLabel, bLabel, dLabel, a2Label])
        updateViews()
    }
    
    func scatterLetters() {
        UIView.animate(withDuration: 2) {
            self.lLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2).concatenating(CGAffineTransform(scaleX: 2, y: 2))
            self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 3)
            self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
            self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 5)
            self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6)
            self.a2Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 7)
        }
    }
    
    func gatherLetters() {
        UIView.animate(withDuration: 2) {
            self.lLabel.transform = .identity
            self.aLabel.transform = .identity
            self.mLabel.transform = .identity
            self.bLabel.transform = .identity
            self.dLabel.transform = .identity
            self.a2Label.transform = .identity
        }
    }
    
    func updateViews() {
        lambdaLogoImage.image = image.image
    }
    
}

