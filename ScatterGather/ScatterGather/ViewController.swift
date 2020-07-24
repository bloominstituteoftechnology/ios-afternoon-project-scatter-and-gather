//
//  ViewController.swift
//  ScatterGather
//
//  Created by Cora Jacobson on 7/23/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isScattered: Bool = false
        
    @IBOutlet weak var logoImageView: UIImageView!
    
    var letterLabels: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        takeYourPositions()
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        switch isScattered {
        case false:
            var newHue: [CGFloat] = []
            var newSaturation: [CGFloat] = []
            var newBrightness: [CGFloat] = []
            for _ in 0...5 {
                newHue.append(CGFloat(Int.random(in: 0...359))/359)
                newSaturation.append(CGFloat(Int.random(in: 75...100))/100)
                newBrightness.append(CGFloat(Int.random(in: 75...100))/100)
            }
            
            let animBlock = {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.logoImageView.alpha = 0
                    for i in 0...5 {
                        self.letterLabels[i].layer.backgroundColor = UIColor(hue: newHue[i], saturation: newSaturation[i], brightness: newBrightness[i], alpha: 1).cgColor
                        self.letterLabels[i].textColor = UIColor(hue: newHue[i], saturation: 0.25, brightness: 1, alpha: 1)
                        self.letterLabels[i].shadowColor = UIColor(hue: newHue[i], saturation: 1, brightness: 0.5, alpha: 1)
                    }
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2) {
                    for label in self.letterLabels {
                        label.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
                        label.center.x = self.view.center.x
                        label.center.y = self.view.center.y - 230
                    }
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.2) {
                    for label in self.letterLabels {
                        let rotationAngle = CGFloat(Int.random(in: 1...20)) / 10
                        label.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi)
                        label.center.x = CGFloat(Int.random(in: 0...Int(self.view.bounds.size.width)))
                        label.center.y = CGFloat(Int.random(in: Int(self.view.bounds.size.height * 0.2)...Int(self.view.bounds.size.height * 0.4)))
                    }
                }
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2) {
                    for label in self.letterLabels {
                        let rotationAngle = CGFloat(Int.random(in: 1...20)) / 10
                        label.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi)
                        label.center.x = CGFloat(Int.random(in: 0...Int(self.view.bounds.size.width)))
                        label.center.y = CGFloat(Int.random(in: Int(self.view.bounds.size.height * 0.4)...Int(self.view.bounds.size.height * 0.6)))
                    }
                }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2) {
                    for label in self.letterLabels {
                        let rotationAngle = CGFloat(Int.random(in: 1...20)) / 10
                        label.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi)
                        label.center.x = CGFloat(Int.random(in: 0...Int(self.view.bounds.size.width)))
                        label.center.y = CGFloat(Int.random(in: Int(self.view.bounds.size.height * 0.6)...Int(self.view.bounds.size.height * 0.8)))
                    }
                }
                UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2) {
                    for label in self.letterLabels {
                        let rotationAngle = CGFloat(Int.random(in: 1...20)) / 10
                        label.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi)
                        label.center.x = CGFloat(Int.random(in: 0...Int(self.view.bounds.size.width)))
                        label.center.y = CGFloat(Int.random(in: Int(self.view.bounds.size.height * 0.8)...Int(self.view.bounds.size.height)))
                    }
                }
                
            }
            
            UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: animBlock, completion: nil)
            
            isScattered = true
            
        case true:
            let animBlock = {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.logoImageView.alpha = 1
                }
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    self.takeYourPositions()
                    for label in self.letterLabels {
                        label.layer.backgroundColor = UIColor(hue: 349/359, saturation: 0.90, brightness: 0.73, alpha: 1).cgColor
                        label.textColor = UIColor(hue: 180/359, saturation: 0, brightness: 1, alpha: 1)
                        label.shadowColor = UIColor(hue: 349/359, saturation: 1, brightness: 0.5, alpha: 1)
                    }
                }
            }
            UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: animBlock, completion: nil)
            isScattered = false
        }
    }
    
    func setUpView() {
        let letters = ["L", "A", "M", "B", "D", "A"]

        for i in 0...5 {
            let label = UILabel(frame: CGRect(x: self.view.center.x, y: 0, width: 55, height: 55))
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 12
            label.text = letters[i]
            label.textAlignment = .center
            label.font = UIFont(name: "Noteworthy-Bold", size: 40)
            label.layer.backgroundColor = UIColor(hue: 349/359, saturation: 0.90, brightness: 0.73, alpha: 1).cgColor
            label.textColor = UIColor(hue: 180/359, saturation: 0, brightness: 1, alpha: 1)
            label.shadowColor = UIColor(hue: 349/359, saturation: 1, brightness: 0.5, alpha: 1)
            label.shadowOffset = CGSize(width: 3, height: 3)
            view.addSubview(label)
            label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
            letterLabels.append(label)
        }
    }
    
    func takeYourPositions() {
        UIView.animate(withDuration: 2.0) {
            let xModifier: [CGFloat] = [-150, -90, -30, 30, 90, 150]
            for i in 0...5 {
                self.letterLabels[i].transform = .identity
                self.letterLabels[i].center.x = self.view.center.x + xModifier[i]
                self.letterLabels[i].center.y = self.view.center.y - 200
            }
        }
    }
    
}

