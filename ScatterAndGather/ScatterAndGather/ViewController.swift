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
            randomColor()
            isScattered = false
        } else {
            scatter()
            labelRandomizer()
            randomColor()
            isScattered = true
        }
    }
    
    func gather() {
        UIView.animate(withDuration: 1, animations: {
            self.lambdaImageView.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 0.82) {
            self.firstLabel.center.x = 19.75
            self.firstLabel.center.y = 43.0
            self.aLabel.center.x = 69.5
            self.aLabel.center.y = 43.0
            self.mLabel.center.x = 130.75
            self.mLabel.center.y = 43.0
            self.bLabel.center.x = 193.75
            self.bLabel.center.y = 43.0
            self.dLabel.center.x = 247.0
            self.dLabel.center.y = 43.0
            self.secondALabel.center.x = 298.5
            self.secondALabel.center.y = 43.0
        }
    }
    
    func scatter() {
        UIView.animate(withDuration: 1, animations: {
            self.lambdaImageView.alpha = 0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.82) {
            self.firstLabel.center.x += CGFloat.random(in: -20...400)
            self.firstLabel.center.y += CGFloat.random(in: -20...750)
            self.aLabel.center.x += CGFloat.random(in: -20...400)
            self.aLabel.center.y += CGFloat.random(in: -20...750)
            self.mLabel.center.x += CGFloat.random(in: -20...400)
            self.mLabel.center.y += CGFloat.random(in: -20...750)
            self.bLabel.center.x += CGFloat.random(in: -20...400)
            self.bLabel.center.y += CGFloat.random(in: -20...750)
            self.dLabel.center.x += CGFloat.random(in: -20...400)
            self.dLabel.center.y += CGFloat.random(in: -20...750)
            self.secondALabel.center.x -= CGFloat.random(in: -20...400)
            self.secondALabel.center.y += CGFloat.random(in: -20...750)
        }
    }
    
    func labelRandomizer() {
        UIView.animateKeyframes(withDuration: 0.82, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.firstLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...30))
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...30))
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...30))
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...30))
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...30))
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.82, animations: {
                self.secondALabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...30))
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
    
    func randomColor() {
        self.firstLabel.textColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        self.firstLabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        
        self.aLabel.textColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        self.aLabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        
        self.mLabel.textColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        self.mLabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        
        self.bLabel.textColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        self.bLabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        
        self.dLabel.textColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        self.dLabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        
        self.secondALabel.textColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
        
        self.secondALabel.backgroundColor = UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: CGFloat.random(in: 0...1))
    }
}


