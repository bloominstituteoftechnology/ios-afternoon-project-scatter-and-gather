//
//  ViewController.swift
//  ScatterAndGatherPT3
//
//  Created by Jessie Ann Griffin on 11/17/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isScattered: Bool = false
    
    let angles = [CGFloat.pi / 4, CGFloat.pi / 6, -CGFloat.pi / 4, -CGFloat.pi / 6, CGFloat.pi / 3, -CGFloat.pi / 3]
    
    @IBOutlet weak var letterLlabel: UILabel!
    @IBOutlet weak var letterA1label: UILabel!
    @IBOutlet weak var letterMlabel: UILabel!
    @IBOutlet weak var letterBlabel: UILabel!
    @IBOutlet weak var letterDlabel: UILabel!
    @IBOutlet weak var letterA2label: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // on View Did Load add create and add all labels to an aray
//        var letters: [UILabel]
        
//        for label in 1...6 {
//            letters.append(label)
//        }
        setUpSubViews()
    }
    
    // Use - for loops
    // USE A CLOSED RANGE!!! (not this)
    func generateRandomX() -> CGFloat {
        let num = CGFloat(arc4random_uniform(255))
        return num
    }
    // min X should be labels frame origin.x
    
    func generateRandomY() -> CGFloat {
        let num = CGFloat(arc4random_uniform(600))
        return num
    }
    
    func randomAngle() -> CGFloat {
        let angle = angles[Int(arc4random_uniform(UInt32(angles.count)))]
        return angle
    }
    
//    func setUpArray() -> [UILabel] {
//        for label in 1...6 {
//            label = UILabel()
//
//        }
//    }
    
    func setUpSubViews() {
        letterLlabel.translatesAutoresizingMaskIntoConstraints = false
        letterLlabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 66.0).isActive = true
        letterLlabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 128.0).isActive = true
        
        letterA1label.translatesAutoresizingMaskIntoConstraints = false
        letterA1label.leadingAnchor.constraint(equalTo: letterLlabel.trailingAnchor, constant: 14.0).isActive = true
        letterA1label.centerYAnchor.constraint(equalTo: letterLlabel.centerYAnchor, constant: 0.0).isActive = true
        
        letterMlabel.translatesAutoresizingMaskIntoConstraints = false
        letterMlabel.leadingAnchor.constraint(equalTo: letterA1label.trailingAnchor, constant: 14.0).isActive = true
        letterMlabel.centerYAnchor.constraint(equalTo: letterA1label.centerYAnchor, constant: 0.0).isActive = true
        
        letterBlabel.translatesAutoresizingMaskIntoConstraints = false
        letterBlabel.leadingAnchor.constraint(equalTo: letterMlabel.trailingAnchor, constant: 14.0).isActive = true
        letterBlabel.centerYAnchor.constraint(equalTo: letterMlabel.centerYAnchor, constant: 0.0).isActive = true
        
        letterDlabel.translatesAutoresizingMaskIntoConstraints = false
        letterDlabel.leadingAnchor.constraint(equalTo: letterBlabel.trailingAnchor, constant: 14.0).isActive = true
        letterDlabel.centerYAnchor.constraint(equalTo: letterBlabel.centerYAnchor, constant: 0.0).isActive = true
        
        letterA2label.translatesAutoresizingMaskIntoConstraints = false
        letterA2label.leadingAnchor.constraint(equalTo: letterDlabel.trailingAnchor, constant: 14.0).isActive = true
        letterA2label.centerYAnchor.constraint(equalTo: letterDlabel.centerYAnchor, constant: 0.0).isActive = true
        letterA2label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -65.0).isActive = true
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        if !isScattered {
            fadeAndScatter()
            isScattered = true
        } else {
            fadeAndGather()
            isScattered = false
        }
    }
    
    @objc func fadeAndScatter() {
      
        let scatterBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.45, animations: {
                self.logoImage.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.setUpScatter(label: self.letterLlabel)
                self.letterLlabel.backgroundColor = UIColor.random()
                self.letterLlabel.textColor = UIColor.random()
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.setUpScatter(label: self.letterA1label)
                
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.setUpScatter(label: self.letterMlabel)
                
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.setUpScatter(label: self.letterBlabel)
                
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.setUpScatter(label: self.letterDlabel)
                
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.setUpScatter(label: self.letterA2label)
                
            })
        }
        UIView.animateKeyframes(withDuration: 3.5, delay: 0.0, options: [], animations: scatterBlock, completion: nil)
    }
    
    func setUpScatter(label: UILabel) {
//        label.center = CGPoint(x: self.generateRandomX(), y: self.generateRandomY())
        label.transform = CGAffineTransform(rotationAngle: self.randomAngle())
        label.transform = CGAffineTransform(translationX: self.generateRandomX(), y: self.generateRandomY())
        label.backgroundColor = UIColor.random()
        label.textColor = UIColor.random()
    }
    
    func setScatter(label: UILabel) -> CGAffineTransform {
        return CGAffineTransform(translationX: self.generateRandomX(), y: self.generateRandomY()).rotated(by: randomAngle())
    }
    
    func resetText(label: UILabel) {
        label.transform = .identity
        label.backgroundColor = .clear
        label.textColor = .black
    }
    
    @objc func fadeAndGather() {
        
//        let letters = [letterLlabel, letterA1label, letterMlabel, letterBlabel, letterDlabel, letterA2label]
        
        let gatherBlock = {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.45, animations: {
                self.logoImage.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.resetText(label: self.letterLlabel)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.resetText(label: self.letterA1label)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.resetText(label: self.letterMlabel)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.resetText(label: self.letterBlabel)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.resetText(label: self.letterDlabel)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.resetText(label: self.letterA2label)
            })
        }
        UIView.animateKeyframes(withDuration: 3.5, delay: 0.0, options: [], animations: gatherBlock, completion: nil)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
