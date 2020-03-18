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
    var isScattered = false
    var squashPoint = CGPoint()

    var letters: [UILabel] = []
    
    // MARK: - Outlets
    @IBOutlet weak var letter1Label: UILabel!
    @IBOutlet weak var letter2Label: UILabel!
    @IBOutlet weak var letter3Label: UILabel!
    @IBOutlet weak var letter4Label: UILabel!
    @IBOutlet weak var letter5Label: UILabel!
    @IBOutlet weak var letter6Label: UILabel!
    @IBOutlet weak var toggleButtonLabel: UIBarButtonItem!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Actions
    @IBAction func toggleButton(_ sender: Any) {
        isScattered.toggle()
        
        if isScattered {
            peformScatter()
            toggleButtonLabel.title = "Gather"
        } else {
            performGather()
            toggleButtonLabel.title = "Scatter"
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        letters = [letter1Label, letter2Label, letter3Label,
                   letter4Label, letter5Label, letter6Label]
    }

    // MARK: - Business logic
    private func performGather() {
//        rotateButtonTapped(uiLabel: letter1Label)
//        springButtonTapped(uiLabel: letter1Label)
//        keyButtonTapped(uiLabel: letter1Label)
        squashButtonTapped(uiLabel: letter1Label)
    }
    
    private func peformScatter() {
        print("isScattered \(isScattered)")
        
//        rotateButtonTapped(uiLabel: letter1Label)
//        springButtonTapped(uiLabel: letter1Label)
//        keyButtonTapped(uiLabel: letter1Label)
        squashButtonTapped(uiLabel: letter1Label)
//        anticipationButtonTapped(uiLabel: letter1Label)
        return
        
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
        // TODO: OK, how paranoid do I need to be about race conditions?
        let scattered = isScattered
            
        UIView.animate(withDuration: 2.0, animations: {
            if scattered {
                uiLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4) // pi is 180 rotation. Not additive. Where you are rotating to.
            } else {
                uiLabel.transform = .identity
            }
        })
    }
    
    private func springButtonTapped(uiLabel: UILabel) {
        uiLabel.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, /* 0.0 - 1.0 */ initialSpringVelocity: 0, options: [], animations: {
            uiLabel.transform = .identity
        },
                       completion: nil)
    }
    
    private func keyButtonTapped(uiLabel: UILabel) {
        let scattered = isScattered
        
        UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [], animations: {

            if scattered {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                    uiLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
                }
                
                // Next quarter of time
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                    uiLabel.transform = .identity
                }
                
                // Next quarter of time
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                    uiLabel.center = CGPoint(x: uiLabel.center.x, y: uiLabel.center.y - 50)
                }
            } else {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                    uiLabel.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi / 4))
                }
                
                // Next quarter of time
                // TODO: This seems to take me to the start of this function. Not original position.
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                    uiLabel.transform = .identity
                }

                // Next quarter of time
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                    uiLabel.center = CGPoint(x: uiLabel.center.x, y: uiLabel.center.y + 50)
                }

                // Last quarter of time
//                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
//                    uiLabel.transform = .identity
//                }
            }
        }, completion: nil)
    }

    private func squashButtonTapped(uiLabel: UILabel) {
        let scattered = isScattered
        
        let animationBlock = {
            if scattered {
                self.squashPoint = uiLabel.center
                uiLabel.center = CGPoint(x: uiLabel.center.x, y: -uiLabel.bounds.size.height)
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                    uiLabel.center = CGPoint(x: uiLabel.center.x, y: self.view.center.y)
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
            } else {
                uiLabel.center = self.squashPoint
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
                    x: self.view.bounds.size.width + uiLabel.bounds.size.width,
                    y: self.view.center.y)
            }
        }

        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animationBlock, completion: nil)
    }
}

