//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Craig Swanson on 11/14/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var isScattered: Bool = false
    var animationDuration: Double = 0
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0
    var letterStartPoint: [CGPoint] = []
    var letterList: [UILabel] = []
    
    
    // MARK: - Outlets
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
    @IBOutlet weak var lambaLogo: UIImageView!
    

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func togglebuttonPressed(_ sender: UIBarButtonItem) {
        // The function looks at the isScattered value and either scatters or gathers
        
        // Define the letter list array
        letterList = [letterL, letterA, letterM, letterB, letterD, letterA2]
        
        // If isScattered is true, then the gatherAnimation is run
        if isScattered {
            gatherAnimation()
            isScattered = false
        } else {
            // set screenWidth and screenHeight based on the device screen size
            screenWidth = view.frame.width
            screenHeight = view.frame.height
            
            // set the duration to a random double bewteen 2 - 4 seconds
            animationDuration = Double.random(in: 2.0...4.0)
            
            // if isScatter is false, then the scatterAnimation is run.
            // Set the array of the starting points of each letter so we know where to return.
            letterStartPoint = [letterL.center, letterA.center, letterM.center, letterB.center, letterD.center, letterA2.center]
            scatterAnimation()
            isScattered = true
        }
    }
    
    
    private func scatterAnimation() {
        // Fade the logo to transparent
        UIView.animate(withDuration: animationDuration) {
            self.lambaLogo.alpha = 0.0
        }
        
        // Animate the random background colors of the letters
        UIView.animate(withDuration: animationDuration) {
            for letter in self.letterList {
                letter.layer.backgroundColor = CGColor(srgbRed: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
            }
        }
        
        // Change the text color of the letters; but I don't think it can animate
        UIView.animate(withDuration: animationDuration) {
            for letter in self.letterList {
                letter.textColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0.5...1))
            }
        }
        
        // The animation block starts the x and y movement slightly before the rotation occurs.
        let animationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 1.0) {
                for letter in self.letterList {
                    letter.transform = CGAffineTransform(rotationAngle: CGFloat.pi * CGFloat.random(in: 0.10...1.90))
                }
            }
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                for letter in self.letterList {
                    letter.center = CGPoint(x: self.view.center.x + CGFloat.random(in: -(self.screenWidth / 1.75)...self.screenWidth / 3), y: self.view.center.y + CGFloat.random(in: -(self.screenHeight / 2)...self.screenHeight / 3))
                }
            }
        }
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: [], animations: animationBlock, completion: nil)
    }
    
    // gatherAnimation returns everything to state before the scatter method.
    private func gatherAnimation() {
        UIView.animate(withDuration: animationDuration) {
            self.lambaLogo.alpha = 1.0
        }
        UIView.animate(withDuration: animationDuration) {
            var indexNumber = 0
            for letter in self.letterList {
                letter.transform = .identity
                letter.center = self.letterStartPoint[indexNumber]
                indexNumber += 1
                letter.layer.backgroundColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 0)
                letter.textColor = .black
            }
        }
    }

}

