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
        setUpSubViews()
    }

    func generateRandomNumber() -> CGFloat {
        let num = CGFloat(arc4random_uniform(255))
        return num
    }
    
    func generateRandomColor() -> CGFloat {
        let num = CGFloat(arc4random_uniform(1))
        return num
    }
    
    func randomAngle() -> CGFloat {
        let angle = angles[Int(arc4random_uniform(UInt32(angles.count)))]
        return angle
    }
    
    func setUpSubViews() {
        
        letterLlabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 66.0).isActive = true
        letterLlabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 128.0).isActive = true
        
        letterA1label.leadingAnchor.constraint(equalTo: letterLlabel.trailingAnchor, constant: 14.0).isActive = true
        letterA1label.centerYAnchor.constraint(equalTo: letterLlabel.centerYAnchor, constant: 0.0).isActive = true
        
        letterMlabel.leadingAnchor.constraint(equalTo: letterA1label.trailingAnchor, constant: 14.0).isActive = true
        letterMlabel.centerYAnchor.constraint(equalTo: letterA1label.centerYAnchor, constant: 0.0).isActive = true
        
        letterBlabel.leadingAnchor.constraint(equalTo: letterMlabel.trailingAnchor, constant: 14.0).isActive = true
        letterBlabel.centerYAnchor.constraint(equalTo: letterMlabel.centerYAnchor, constant: 0.0).isActive = true
        
        letterDlabel.leadingAnchor.constraint(equalTo: letterBlabel.trailingAnchor, constant: 14.0).isActive = true
        letterDlabel.centerYAnchor.constraint(equalTo: letterBlabel.centerYAnchor, constant: 0.0).isActive = true
        
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
        label.center = CGPoint(x: self.generateRandomNumber(), y: self.generateRandomNumber())
        label.transform = CGAffineTransform(rotationAngle: self.randomAngle())
        label.tintColor = UIColor(red: self.generateRandomColor(),
                                  green: self.generateRandomColor(),
                                  blue: self.generateRandomColor(),
                                  alpha: 1.0)
        label.textColor = UIColor(red: self.generateRandomColor(),
                                  green: self.generateRandomColor(),
                                  blue: self.generateRandomColor(),
                                  alpha: 1.0)
    }
    
    @objc func fadeAndGather() {
        
        let gatherBlock = {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.45, animations: {
                self.logoImage.alpha = 1.0
                self.setUpSubViews()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.letterLlabel.transform = .identity
                self.letterLlabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 66.0).isActive = true
                self.letterLlabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 128.0).isActive = true
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.letterA1label.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.letterMlabel.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.letterBlabel.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.letterDlabel.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.letterA2label.transform = .identity
            })

        }
        UIView.animateKeyframes(withDuration: 3.5, delay: 0.0, options: [], animations: gatherBlock, completion: nil)

    }
}

