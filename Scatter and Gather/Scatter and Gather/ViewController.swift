//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Dennis Rudolph on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool = false
    var origins: [[CGFloat]] = []
  
    @IBOutlet weak var labelL: UILabel!
    @IBOutlet weak var labelA1: UILabel!
    @IBOutlet weak var labelM: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelD: UILabel!
    @IBOutlet weak var labelA2: UILabel!
    
    @IBOutlet weak var LambdaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setOrigins()
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        if isScattered {
           gather()
        } else {
            scatter()
        }
    }
    
    func scatter() {
        
        isScattered.toggle()
        
        let labels = [labelL, labelA1, labelM, labelB, labelD, labelA2]
        
        for label in labels {
            
            var currentLabel: UILabel
            
            switch label {
            case labelL:
                currentLabel = self.labelL
            case labelA1:
                currentLabel = self.labelA1
            case labelM:
                currentLabel = self.labelM
            case labelB:
                currentLabel = self.labelB
            case labelD:
                currentLabel = self.labelD
            default:
                currentLabel = self.labelA2
            }
            
            UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    
                    // Labels
                    currentLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 0.51...2))
                    currentLabel.center = CGPoint(x: .random(in: 0...self.view.bounds.width/1.5), y: .random(in: 0...self.view.bounds.height/1.5))
                    currentLabel.backgroundColor = UIColor.randomLightAlpha
                    currentLabel.textColor = UIColor.randomDarkAlpha
                    
                    // Logo
                    self.LambdaImageView.alpha = 0
                }
            }, completion: nil)
        }
    }
    
    func gather() {
        isScattered.toggle()
        
        let labels = [labelL, labelA1, labelM, labelB, labelD, labelA2]
        
        for label in labels {
            
            var currentLabel: UILabel
            var iteration: Int = 0
            
            switch label {
            case labelL:
                currentLabel = self.labelL
                iteration = 0
            case labelA1:
                currentLabel = self.labelA1
                iteration = 1
            case labelM:
                currentLabel = self.labelM
                iteration = 2
            case labelB:
                currentLabel = self.labelB
                iteration = 3
            case labelD:
                currentLabel = self.labelD
                iteration = 4
            default:
                currentLabel = self.labelA2
                iteration = 5
            }
            
            UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    
                    // Labels
                    currentLabel.transform = .identity
                    currentLabel.frame.origin.x = self.origins[iteration][0]
                    currentLabel.frame.origin.y = self.origins[iteration][1]
                    currentLabel.backgroundColor = .white
                    currentLabel.textColor = .black
                    
                    // Logo
                    self.LambdaImageView.alpha = 1
                }
            }, completion: nil)
        }
    }
    
    func setOrigins() {
        let labels = [labelL, labelA1, labelM, labelB, labelD, labelA2]
        
        for label in labels {
            guard let label = label else { return }
            var originsArray: [CGFloat] = []
            let originalX: CGFloat = label.frame.origin.x
            let originalY: CGFloat = label.frame.origin.y
            originsArray.append(originalX)
            originsArray.append(originalY)
            self.origins.append(originsArray)
        }
    }
}
extension UIColor {
    static var randomLightAlpha: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 0.2)
    }
    static var randomDarkAlpha: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1)
    }
}

