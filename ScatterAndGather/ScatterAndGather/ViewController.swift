//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Alex Shillingford on 8/14/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var secondALabel: UILabel!
    @IBOutlet weak var lambdaImageView: UIImageView!
    
    
    var isScattered: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 1, animations: {
            self.lambdaImageView.alpha = 0
        }, completion: nil)
        if isScattered {
            /*
            let gather = {
                UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 1, animations: {
                    self.firstLabel.center.x -= 100
                    self.firstLabel.center.y -= 57
                    self.aLabel.center.x -= 300
                    self.aLabel.center.y -= 200
                    self.mLabel.center.x -= 65
                    self.mLabel.center.y -= 20
                    self.bLabel.center.x -= 20
                    self.bLabel.center.y -= 475
                    self.dLabel.center.x -= 20
                    self.dLabel.center.y -= 157
                    self.secondALabel.center.x += 200
                })
            }
            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: gather, completion: nil)
            */
            UIView.animate(withDuration: 0.82) {
                self.firstLabel.center.x -= 100
                self.firstLabel.center.y -= 57
                self.aLabel.center.x -= 300
                self.aLabel.center.y -= 200
                self.mLabel.center.x -= 65
                self.mLabel.center.y -= 20
                self.bLabel.center.x -= 20
                self.bLabel.center.y -= 475
                self.dLabel.center.x -= 20
                self.dLabel.center.y -= 157
                self.secondALabel.center.x += 200
                self.secondALabel.center.y += 500
            }
            isScattered = false
        } else {
            let scatter = {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                    self.firstLabel.center.x += 100
                    self.firstLabel.center.y += 57
                    self.aLabel.center.x += 300
                    self.aLabel.center.y += 200
                    self.mLabel.center.x += 65
                    self.mLabel.center.y += 20
                    self.bLabel.center.x += 20
                    self.bLabel.center.y += 475
                    self.dLabel.center.x += 20
                    self.dLabel.center.y += 157
                    self.secondALabel.center.x -= 200
                    self.secondALabel.center.y += 500
                })
            }
            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: scatter, completion: nil)
            isScattered = true
        }
        
        
    }
}

