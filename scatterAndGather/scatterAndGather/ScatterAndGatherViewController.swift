//
//  ScatterAndGatherViewController.swift
//  scatterAndGather
//
//  Created by Dojo on 7/26/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

class ScatterAndGatherViewController: UIViewController {
    
    
    

    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel1: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var aLabel2: UILabel!
    
    @IBOutlet weak var lambdaImage: UIImageView!
    @IBOutlet weak var toggleButtonLabel: UIBarButtonItem!
    
    
    
    var arrayOfFunctions = [0, 1, 2, 3, 4, 0]
    var allLabels: [UILabel] = []
    var colors = [UIColor.red, UIColor.blue, UIColor.brown,
                  UIColor.cyan, UIColor.orange, UIColor.green,
                  UIColor.yellow]
    private var squashPoint = CGPoint()
    private var anticipationPoint = CGPoint()
    
    private var isScattered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allLabels = [lLabel,
                     aLabel1,
                     mLabel,
                     bLabel,
                     dLabel,
                     aLabel2]
        
    }
    
    @IBAction func toggleTapped(_ sender: Any) {
        isScattered.toggle()
        
        if isScattered {
            scatterLabels()
            toggleButtonLabel.title = "Gather"
        } else {
            gatherLabels()
            toggleButtonLabel.title = "Scatter"
        }
    }
    
    
    func scatterLabels() {
        
        arrayOfFunctions.shuffle()
        var round = 0
        
        for letter in allLabels {
            
            switch arrayOfFunctions[round] {
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
            round += 1
        }
    }
    
    func gatherLabels() {
        var round = 0
        
        for letter in allLabels {
            
            switch arrayOfFunctions[round] {
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
            round += 1
        }
        
    }
    
    
    private func rotateButtonTapped(uiLabel: UILabel!) {
        let scattered = isScattered
        
        UIView.animate(withDuration: 2.0, animations: {
            if scattered {
                uiLabel.textColor = self.colors.randomElement()
                uiLabel.backgroundColor = self.colors.randomElement()?.withAlphaComponent(0.25)
                uiLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4) // pi is 180 rotation. Not additive. Where you are rotating to.
            } else {
                uiLabel.textColor = UIColor.black
                uiLabel.backgroundColor = UIColor.clear
                uiLabel.alpha = 1.0
                uiLabel.transform = .identity
            }
        })
    }
    
    private func springButtonTapped(uiLabel: UILabel) {
        if isScattered {
            uiLabel.textColor = self.colors.randomElement()
            uiLabel.backgroundColor = self.colors.randomElement()?.withAlphaComponent(0.25)
        }
        uiLabel.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, /* 0.0 - 1.0 */ initialSpringVelocity: 0, options: [], animations: {
            uiLabel.transform = .identity
        },
                       completion: nil)
        if !isScattered {
            uiLabel.textColor = UIColor.black
            uiLabel.backgroundColor = UIColor.clear
            uiLabel.alpha = 1.0
        }
    }
    
    private func keyButtonTapped(uiLabel: UILabel) {
        let scattered = isScattered
        
        UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [], animations: {
            
            if scattered {
                uiLabel.textColor = self.colors.randomElement()
                self.lambdaImage.alpha = 0
                uiLabel.backgroundColor = self.colors.randomElement()?.withAlphaComponent(0.25)
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                    uiLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
                }
                
                
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                    uiLabel.transform = .identity
                }
                
                
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                    uiLabel.center = CGPoint(x: uiLabel.center.x, y: uiLabel.center.y - 50)
                }
            } else {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                    uiLabel.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi / 4))
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                    uiLabel.transform = .identity
                }
                
                
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                    uiLabel.center = CGPoint(x: uiLabel.center.x, y: uiLabel.center.y + 50)
                }
                
                uiLabel.textColor = UIColor.black
                uiLabel.backgroundColor = UIColor.clear
                uiLabel.alpha = 1.0
                self.lambdaImage.alpha = 1
                
            }
        }, completion: nil)
    }
    
    private func squashButtonTapped(uiLabel: UILabel) {
        let scattered = isScattered
        
        let animationBlock = {
            if scattered {
                uiLabel.textColor = self.colors.randomElement()
                uiLabel.backgroundColor = self.colors.randomElement()?.withAlphaComponent(0.25)
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
                uiLabel.textColor = UIColor.black
                uiLabel.backgroundColor = UIColor.clear
                uiLabel.alpha = 1.0
                uiLabel.center = self.squashPoint
            }
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animationBlock, completion: nil)
    }
    
    private func anticipationButtonTapped(uiLabel: UILabel) {
        let scattered = isScattered
        
        let animationBlock = {
            if scattered {
                uiLabel.textColor = self.colors.randomElement()
                uiLabel.backgroundColor = self.colors.randomElement()?.withAlphaComponent(0.25)
                self.anticipationPoint = uiLabel.center
                
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
            } else {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0) {
                    uiLabel.center = self.anticipationPoint
                }
                
                UIView.addKeyframe(withRelativeStartTime: 1.4, relativeDuration: 0.1) {
                    uiLabel.transform = CGAffineTransform(rotationAngle: 0)
                }
                
                uiLabel.textColor = UIColor.black
                uiLabel.backgroundColor = UIColor.clear
                uiLabel.alpha = 1.0
            }
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animationBlock, completion: nil)
    }
    
    
    
    
}
