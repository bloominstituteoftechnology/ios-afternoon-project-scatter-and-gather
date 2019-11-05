//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by BDawg on 11/5/19.
//  Copyright © 2019 Brandi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel1: UIStackView!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var aLabel2: UIStackView!
    @IBOutlet weak var lambdaLogoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        var isScattered: Bool
        lambdaLogoImage.center = view.center
        
        let scatter = {
            UIView.animate(withDuration: 2.0) {
                self.lambdaLogoImage.alpha = 0.0
            }
        }
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: scatter, completion: nil)
    }
    


    
}

