//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Andrew Ruiz on 10/8/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var letterOne: UILabel!
    @IBOutlet weak var letterTwo: UILabel!
    @IBOutlet weak var letterThree: UILabel!
    @IBOutlet weak var letterFour: UILabel!
    @IBOutlet weak var letterFive: UILabel!
    @IBOutlet weak var letterSix: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var isScattered: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        if isScattered == true {
            scatter()
            isScattered = false
            print("false")
        } else {
            gather()
            isScattered = true
            print("true")
        }
    }
    
    func gather() {
        
        // Bring image back to full opacity
          UIView.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseOut,
                            animations: {
                                self.imageView.alpha = 1.0
             })
        
        UIView.animate(withDuration: 1) {
            self.letterOne.transform = .identity
            self.letterOne.backgroundColor = .clear
            self.letterOne.textColor = .black
            
            self.letterTwo.transform = .identity
            self.letterTwo.backgroundColor = .clear
            self.letterTwo.textColor = .black
            
            self.letterThree.transform = .identity
            self.letterThree.backgroundColor = .clear
            self.letterThree.textColor = .black
            
            self.letterFour.transform = .identity
            self.letterFour.backgroundColor = .clear
            self.letterFour.textColor = .black
            
            self.letterFive.transform = .identity
            self.letterFive.backgroundColor = .clear
            self.letterFive.textColor = .black
            
            self.letterSix.transform = .identity
            self.letterSix.backgroundColor = .clear
            self.letterSix.textColor = .black
        }
    }
    
    func scatter() {

        // Fade imageView
        UIView.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseOut,
                       animations: {
                        self.imageView.alpha = 0.0
        })
        
        // Letters
        UIView.animate(withDuration: 2, delay: 0.2, options: .curveEaseOut,
                       animations: {
                        
                        // Random Background Color
                        self.letterOne.backgroundColor = self.randomColor()
                        self.letterTwo.backgroundColor = self.randomColor()
                        self.letterThree.backgroundColor = self.randomColor()
                        self.letterFour.backgroundColor = self.randomColor()
                        self.letterFive.backgroundColor = self.randomColor()
                        self.letterSix.backgroundColor = self.randomColor()

                        
                        // Random Text Color
                        self.letterOne.textColor = self.randomColor()
                        self.letterTwo.textColor = self.randomColor()
                        self.letterThree.textColor = self.randomColor()
                        self.letterFour.textColor = self.randomColor()
                        self.letterFive.textColor = self.randomColor()
                        self.letterSix.textColor = self.randomColor()
                        
                        // Random Position
                        self.letterOne.transform = self.randomMovementAndRotation()
                        self.letterTwo.transform = self.randomMovementAndRotation()
                        self.letterThree.transform = self.randomMovementAndRotation()
                        self.letterFour.transform = self.randomMovementAndRotation()
                        self.letterFive.transform = self.randomMovementAndRotation()
                        self.letterSix.transform = self.randomMovementAndRotation()
        })

        
    }
    
    func randomColor() -> UIColor {
        return UIColor(cgColor: .init(srgbRed: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 1.0))
    }
    
    func randomMovementAndRotation() -> CGAffineTransform {
        return CGAffineTransform(rotationAngle: CGFloat.random(in: 0...100)).translatedBy(x: CGFloat.random(in: 90...300), y: CGFloat.random(in: 0...1000))
    }
    
}

