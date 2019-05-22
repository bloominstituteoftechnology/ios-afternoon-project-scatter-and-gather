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
        logoImageView.image = lambdaLogoImage
    }
    
    var isScattered: Bool = true
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        print(isScattered)
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
    
    func scatterAnimation() {
        UIView.animate(withDuration: 1) {
            self.logoImageView.alpha = 0
        }
    }
    
    func gatherAnimation() {
        logoImageView.alpha = 0
        UIView.animate(withDuration: 1) {
            self.logoImageView.alpha = 1
        }
    }
}

