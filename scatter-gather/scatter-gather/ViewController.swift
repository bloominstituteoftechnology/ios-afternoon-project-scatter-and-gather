//
//  ViewController.swift
//  scatter-gather
//
//  Created by patelpra on 4/8/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var letterLLabel: UILabel!
    @IBOutlet weak var letterALabel: UILabel!
    @IBOutlet weak var letterMLabel: UILabel!
    @IBOutlet weak var letterBLabel: UILabel!
    @IBOutlet weak var letterDLabel: UILabel!
    @IBOutlet weak var lastALabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var isScattered: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.letterLLabel.center = CGPoint(x: 0.0, y: 0.0)
        self.letterALabel.center = CGPoint(x: 46.5, y: 0.0)
        self.letterMLabel.center = CGPoint(x: 105.0, y: 0.0)
        self.letterBLabel.center = CGPoint(x: 162.0, y: 0.0)
        self.letterDLabel.center = CGPoint(x: 212.0, y: 0.0)
        self.lastALabel.center = CGPoint(x: 262.0, y: 0.0)
    }
  
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        if isScattered {
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.5, options: [], animations: {
                self.imageView.alpha = 0.0
            }, completion: nil)
            
            print(self.view.bounds.size.width)
            print(self.letterLLabel.bounds.size.width)
            print(self.view.center.y)
            
            self.randomColors(revert: false)
            
            let animBlock = {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2, animations: {
                    self.letterLLabel.center = CGPoint(x: self.random_location(), y: self.random_location())
                    self.letterLLabel.transform = CGAffineTransform(scaleX: self.random_angle(), y: self.random_angle())
                })
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.2, animations: {
                    self.letterALabel.center = CGPoint(x: self.random_location(), y: self.random_location())
                    self.letterALabel.transform = CGAffineTransform(scaleX: self.random_angle(), y: self.random_angle())
                })
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2, animations: {
                    self.letterMLabel.center = CGPoint(x: self.random_location(), y: self.random_location())
                    self.letterMLabel.transform = CGAffineTransform(scaleX: self.random_angle(), y: self.random_angle())
                })
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2, animations: {
                    self.letterBLabel.center = CGPoint(x: self.random_location(), y: self.random_location())
                    self.letterBLabel.transform = CGAffineTransform(scaleX: self.random_angle(), y: self.random_angle())
                })
                UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
                    self.letterDLabel.center = CGPoint(x: self.random_location(), y: self.random_location())
                    self.letterDLabel.transform = CGAffineTransform(scaleX: self.random_angle(), y: self.random_angle())
                })
                UIView.addKeyframe(withRelativeStartTime: 1.0, relativeDuration: 0.2, animations: {
                    self.lastALabel.center = CGPoint(x: self.random_location(), y: self.random_location())
                    self.lastALabel.transform = CGAffineTransform(scaleX: self.random_angle(), y: self.random_angle())
                })
            }
            UIView.animateKeyframes(withDuration: 2.0, delay: 0.0, options: [], animations: animBlock, completion: nil)
        } else {
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.5, options: [], animations: {
                self.imageView.alpha = 1.0
            }, completion: nil)
            
            self.randomColors(revert: true)
            
            let animBlock = {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4, animations: {
                    self.letterLLabel.center = CGPoint(x: 0, y: 0)
                    self.letterLLabel.transform = .identity
                })
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.4, animations: {
                    self.letterALabel.center = CGPoint(x: 46.5, y: 0)
                    self.letterALabel.transform = .identity
                })
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.4, animations: {
                    self.letterMLabel.center = CGPoint(x: 105.0, y: 0)
                    self.letterMLabel.transform = .identity
                })
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                    self.letterBLabel.center = CGPoint(x: 16.0, y: 0)
                    self.letterBLabel.transform = .identity
                })
                UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.4, animations: {
                    self.letterDLabel.center = CGPoint(x: 212.0, y: 0)
                    self.letterDLabel.transform = .identity
                })
                UIView.addKeyframe(withRelativeStartTime: 1.0, relativeDuration: 0.4, animations: {
                    self.lastALabel.center = CGPoint(x: 262.0, y: 0)
                    self.lastALabel.transform = .identity
                })
            }
            UIView.animateKeyframes(withDuration: 1.2, delay: 0.0, options: [], animations: animBlock, completion: nil)
        }
        
        isScattered = !isScattered
    }
    
    private func randomColors(revert: Bool) {
        if revert {
            self.view.backgroundColor = .white
            self.letterLLabel.textColor = .black
            self.letterALabel.textColor = .black
            self.letterMLabel.textColor = .black
            self.letterBLabel.textColor = .black
            self.letterDLabel.textColor = .black
            self.lastALabel.textColor = .black
        } else {
            self.view.backgroundColor = .random()
            self.letterLLabel.textColor = .random()
            self.letterALabel.textColor = .random()
            self.letterMLabel.textColor = .random()
            self.letterBLabel.textColor = .random()
            self.letterDLabel.textColor = .random()
            self.lastALabel.textColor = .random()
        }
    }
    
    private func random_location() -> CGFloat {
        return CGFloat.random(in: 0...450)
    }
    
    private func random_angle() -> CGFloat {
        return CGFloat.random(in: 0...2)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
    
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
    }
}


