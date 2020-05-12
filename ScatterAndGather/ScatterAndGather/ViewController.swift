//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Kelson Hartle on 5/11/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    var isScattered = false
    
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    @IBOutlet weak var lambdaLogo: UIImageView!
    @IBOutlet var labels: [UILabel]!
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        if isScattered {
            scramble()
            toggleButton.title = "Unscramble"
        } else {
            unscramble()
            toggleButton.title = "Scramble"
        }
        isScattered = !isScattered
    }
    //Mark: - Private Methods
    private func scramble() {
        let animationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.42) {
                self.lambdaLogo.alpha = 0
                for label in self.labels {
                    label.transform = self.randomTranslation(for: label)
                }
            }
            UIView.addKeyframe(withRelativeStartTime: 0.42, relativeDuration: 0.84) {
                for label in self.labels {
                    label.transform = self.randomTranslation(for: label)
                }
            }
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.42) {
                for label in self.labels {
                    label.layer.backgroundColor = self.randomColor().cgColor
                }
            }
        }
        UIView.animateKeyframes(withDuration: 4.2, delay: 0.0, options: [], animations: animationBlock)
    }
    private func unscramble() {
        UIView.animate(withDuration: 1.42) {
            self.lambdaLogo.alpha = 1
            for label in self.labels {
                label.transform = .identity
                label.layer.backgroundColor = UIColor.white.cgColor
            }
        }
    }
    private func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    private func randomTranslation(for label: UILabel) -> CGAffineTransform {
        let minX = -label.frame.origin.x + self.view.safeAreaInsets.left
        let maxX = self.view.frame.width - (label.frame.origin.x + label.frame.width + self.view.safeAreaInsets.right)
        let x = (CGFloat.random(in: minX...maxX))
        let minY = -label.frame.origin.y + self.view.safeAreaInsets.top
        let maxY = self.view.frame.height - (label.frame.origin.y + label.frame.height + self.view.safeAreaInsets.bottom)
        let y = (CGFloat.random(in: minY...maxY))
        return CGAffineTransform(translationX: x, y: y).rotated(by: CGFloat.random(in: -2 * CGFloat.pi...2 * CGFloat.pi))
    }
}


