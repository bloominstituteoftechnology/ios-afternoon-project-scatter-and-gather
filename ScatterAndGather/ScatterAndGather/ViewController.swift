//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Shawn James on 4/14/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    @IBOutlet weak var lambdaLogoImageView: UIImageView!
    @IBOutlet var letterLabels: [UILabel]!
    @IBOutlet weak var movableView: UIView!
    
    private var originalLocationsOfLetterLabels = [CGPoint]()
    
    private var isScattered = false {
        // dynamic toggle button title
        didSet {
            switch isScattered {
            case true:
                toggleButton.title = "Gather Letters"
            default:
                toggleButton.title = "Scatter Letters"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeOriginalLetterLabelLocations()
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
        switch isScattered {
        case true:
            // perform "gather" animation sequence
            resetLetters()
            fadeInLogo(lambdaLogoImageView)
        default:
            // perform "scatter" animation sequence
            fadeOutLogo(lambdaLogoImageView)
            moveLettersToRandomLocations()
            assignLettersRandomColors()
            rotateLetters()
        }
        
        // toggle isScattered
        isScattered.toggle()
    }
    
    
    // MARK: - Scatter Animation Methods
    
    private func fadeOutLogo(_ logo: UIImageView) {
        UIView.animate(withDuration: 2.0) { logo.alpha = 0 }
    }
    
    private func moveLettersToRandomLocations() {
        
        for letterLabel in letterLabels {
            
            // Find width and height of labels
            let letterLabelWidth = letterLabel.frame.width
            let letterLabelHeight = letterLabel.frame.height
            
            // Find the width and height of the enclosing view
            let viewWidth = movableView.bounds.width
            let viewHeight = movableView.bounds.height
            
            // Compute width and height of the area to contain the button's center
            let xwidth = viewWidth - letterLabelWidth
            let yheight = viewHeight - letterLabelHeight
            
            // Generate a random x and y offset
            let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
            let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
            
            UIView.animate(withDuration: 2.0) {
                
                letterLabel.center = CGPoint(x: xoffset + letterLabelWidth / 2,
                                             y: yoffset + letterLabelHeight / 2)
            }
        }
    }
    
    
    private func assignLettersRandomColors() {
        
        for letterLabel in letterLabels {
            UIView.animate(withDuration: 2.0) {
                letterLabel.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0/255...255/255),
                                                      green: CGFloat.random(in: 0/255...255/255),
                                                      blue: CGFloat.random(in: 0/255...255/255),
                                                      alpha: 1)
                
                letterLabel.textColor = UIColor(displayP3Red: CGFloat.random(in: 0/255...255/255),
                                                green: CGFloat.random(in: 0/255...255/255),
                                                blue: CGFloat.random(in: 0/255...255/255),
                                                alpha: 1)
            }
        }
    }
    
    private func rotateLetters() {
        for letterLabel in letterLabels {
            UIView.animate(withDuration: 2.0) {
                letterLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: (CGFloat.pi / 2)...(CGFloat(UInt32(2)) * CGFloat.pi)))
            }
        }
    }
    
    // MARK: - Gather Animation Methods
    
    private func fadeInLogo(_ logo: UIImageView) {
        UIView.animate(withDuration: 2.0) { logo.alpha = 1 }
    }
    
    private func resetLetters() {
        
        var index: Int = 0
        
        for letterLabel in letterLabels {
            
            UIView.animate(withDuration: 2.0) {
                
                letterLabel.center = self.originalLocationsOfLetterLabels[index]
                letterLabel.transform = CGAffineTransform.identity
                letterLabel.backgroundColor = nil
                letterLabel.textColor = .black
            }
            
            index += 1
        }
    }
    
    // MARK: - Helper Method
    
    private func storeOriginalLetterLabelLocations() {
        for letterLabel in letterLabels {
            originalLocationsOfLetterLabels.append(letterLabel.center)
        }
    }
    
}
