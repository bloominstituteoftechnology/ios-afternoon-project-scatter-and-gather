//
//  ViewController.swift
//  Scatter
//
//  Created by Mark Gerrior on 3/17/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properites
    var isScattered = false {
        didSet {
            peformScatter()
        }
    }
    
    var letters: [UILabel] = []
    
    // MARK: - Outlets
    @IBOutlet weak var letter1Label: UILabel!
    @IBOutlet weak var letter2Label: UILabel!
    @IBOutlet weak var letter3Label: UILabel!
    @IBOutlet weak var letter4Label: UILabel!
    @IBOutlet weak var letter5Label: UILabel!
    @IBOutlet weak var letter6Label: UILabel!

    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Actions
    @IBAction func toggleButton(_ sender: Any) {
        isScattered.toggle()
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        letters = [letter1Label, letter2Label, letter3Label,
                   letter4Label, letter5Label, letter6Label]
    }

    // MARK: - Business logic
    
    func peformScatter() {
        print("isScattered \(isScattered)")
        
        for letter in letters {
            
            switch Int.random(in: 0...4) {
            case 0:
                rotateButtonTapped(uiLabel: letter)
            case 1:
                springButtonTapped(uiLabel: letter)
            case 2:
                keyButtonTapped(uiLabel: letter)
            case 3:
                squashButtonTapped(uiLabel: letter)
            default:
                anticipationButtonTapped(uiLabel: letter)
            }
        }
    }
    
    
    private func rotateButtonTapped(uiLabel: UILabel!) {
        // FIXME: Delete> label.center = view.center
        
        UIView.animate(withDuration: 2.0, animations: {
            uiLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4) // pi is 180 rotation. Not additive. Where you are rotating to.
        }) { _ in
            UIView.animate(withDuration: 2.0) {
                // You could do this...
                // self.label.transform = CGAffineTransform(rotationAngle: 0)
                // But this is the safest.
                uiLabel.transform = .identity
            }
        }
    }
    
    private func springButtonTapped(uiLabel: UILabel) {
        // FIXME: Delete> label.center = view.center
        
        uiLabel.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, /* 0.0 - 1.0 */ initialSpringVelocity: 0, options: [], animations: {
            uiLabel.transform = .identity
        },
                       completion: nil)
    }
    
    private func keyButtonTapped(uiLabel: UILabel) {
        // FIXME: Delete> label.center = view.center
        
        UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                uiLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
            }
            
            // Next quarter of time
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                uiLabel.transform = .identity
            }

            // Next quarter of time
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                uiLabel.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 50)
            }

            // Last quarter of time
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                uiLabel.center = self.view.center
            }
        }, completion: nil)
    }

    private func squashButtonTapped(uiLabel: UILabel) {
        // FIXME: Delete> label.center = CGPoint(x: view.center.x, y: -label.bounds.size.height)
        
        let animationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                uiLabel.center = self.view.center
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                uiLabel.transform = CGAffineTransform(scaleX: 1.7, y: 0.6)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2) {
                uiLabel.transform = CGAffineTransform(scaleX: 0.6, y: 1.7)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.15) {
                uiLabel.transform = CGAffineTransform(scaleX: 1.11, y: 0.9)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.15) {
                uiLabel.transform = .identity
            }
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animationBlock, completion: nil)
    }

    private func anticipationButtonTapped(uiLabel: UILabel) {
        // FIXME: Delete> label.center = view.center
        
        let animationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
                uiLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 16.0)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                uiLabel.transform = CGAffineTransform(rotationAngle: -1 * CGFloat.pi / 16.0)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8) {
                uiLabel.center = CGPoint(
                    x: self.view.bounds.size.width + self.letter1Label.bounds.size.width,
                    y: self.view.center.y)
            }
        }

        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animationBlock, completion: nil)
    }
}

