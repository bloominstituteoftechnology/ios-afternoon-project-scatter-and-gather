//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Matthew Martindale on 4/8/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool = false
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var secondALabel: UILabel!
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    
    @IBAction func toggleButtonTapped(_ sender: UIBarButtonItem) {
        isScattered.toggle()
        
        if isScattered == true {
            
            UIView.animate(withDuration: 2) {
                self.lambdaLogoImageView.alpha = 0
            }
            
        } else {
            UIView.animate(withDuration: 2) {
                self.lambdaLogoImageView.alpha = 1
            }
        }
    }
}



