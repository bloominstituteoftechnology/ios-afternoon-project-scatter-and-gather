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
        if isScattered {
            scatterAnimation()
        } else {
            gatherAnimation()
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
        
    }
    
    func gatherAnimation() {
        
    }
}

