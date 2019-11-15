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
    let animationDuration = 3.5
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
            
            // if isScatter is false, then the scatterAnimation is run.
            // Set the array of the starting points of each letter so we know where to return.
            letterStartPoint = [letterL.center, letterA.center, letterM.center, letterB.center, letterD.center, letterA2.center]
            scatterAnimation()
            isScattered = true
        }
    }
    
    
    private func scatterAnimation() {
        UIView.animate(withDuration: animationDuration) {
            self.lambaLogo.alpha = 0.0
        }
        let animationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                for letter in self.letterList {
                    letter.transform = CGAffineTransform(rotationAngle: CGFloat.pi * CGFloat.random(in: 0.15...1.85))
                }
            }
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                for letter in self.letterList {
                    letter.center = CGPoint(x: self.view.center.x + CGFloat.random(in: -250...150), y: self.view.center.y + CGFloat.random(in: -450...200))
                }
            }
        }
        
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: [], animations: animationBlock, completion: nil)
    }
    
    private func gatherAnimation() {
        UIView.animate(withDuration: animationDuration) {
            self.lambaLogo.alpha = 1.0
        }
        UIView.animate(withDuration: animationDuration) {
            for letter in self.letterList {
                letter.transform = .identity
            }
        }
        UIView.animate(withDuration: animationDuration) {
            var indexNumber = 0
            for letter in self.letterList {
                letter.center = self.letterStartPoint[indexNumber]
                indexNumber += 1
            }
        }
    }

}

