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
        if isScattered {
            gather()
            labelReturn()
            isScattered = false
        } else {
            scatter()
            labelRandomizer()
            isScattered = true
        }
    }
    
    func gather() {
        UIView.animate(withDuration: 1, animations: {
            self.lambdaImageView.alpha = 1
        }, completion: nil)
        
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
            self.secondALabel.center.y -= 500
        }
    }
    
    func scatter() {
        UIView.animate(withDuration: 1, animations: {
            self.lambdaImageView.alpha = 0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.82) {
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
        }
    }
    
    func labelRandomizer() {
        UIView.animateKeyframes(withDuration: 0.82, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.firstLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 3)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 0.5)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.secondALabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 7)
            })
        })
    }
    
    func labelReturn() {
        UIView.animate(withDuration: 0.82) {
            self.firstLabel.transform = .identity
            self.aLabel.transform = .identity
            self.mLabel.transform = .identity
            self.bLabel.transform = .identity
            self.dLabel.transform = .identity
            self.secondALabel.transform = .identity
        }
    }
}


