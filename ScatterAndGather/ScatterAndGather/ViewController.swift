//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Jessie Ann Griffin on 9/22/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!

    
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func toggleButtonPressed(_ sender: Any) {
        logoFade()
    }
    
    @objc func logoFade() {
        
        let fadeBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.logoImage.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.logoImage.alpha = 1.0
            })
        }
        
        UIView.animateKeyframes(withDuration: 2.5, delay: 0.0, options: [], animations: fadeBlock, completion: nil)
    }
}

