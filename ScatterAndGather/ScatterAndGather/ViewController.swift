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
        for letterLabel in letterLabels {
            letterLabel = CGAffineTransform.identity
        }
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
        
                let minX = (UIScreen.main.bounds.width / 2) * (-1)
                let maxX = UIScreen.main.bounds.width / 2
                let minY = UIScreen.main.bounds.height / 2
                let maxY = (UIScreen.main.bounds.height / 2) * (-1)
        
        for letterLabel in letterLabels {
            
//                        let letterLabelWidth = letterLabel.frame.width
//                        let letterLabelHeight = letterLabel.frame.height
//
//                        // Find the width and height of the enclosing view
//                        let viewWidth = letterLabel.superview!.bounds.width
//                        let viewHeight = letterLabel.superview!.bounds.height
//
//                        // Compute width and height of the area to contain the button's center
//                        let xwidth = viewWidth - letterLabelWidth
//                        let yheight = viewHeight - letterLabelHeight
//
//                        // Generate a random x and y offset
//                        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
//                        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
//
//                        // Offset the button's center by the random offsets.
//                        letterLabel.center.x = xoffset + letterLabelWidth / 2
//                        letterLabel.center.y = yoffset + letterLabelHeight / 2
            
            
            UIView.animate(withDuration: 2.0) {
                
//                                letterLabel.transform = CGAffineTransform(translationX: xoffset + letterLabelWidth / 2,
//                                                                          y: yoffset + letterLabelHeight / 2)
                
//                                letterLabel.center = CGPoint(x: CGFloat.random(in: minX...maxX),
//                                                             y: CGFloat.random(in: maxY...minY))
                
//                                letterLabel.transform = CGAffineTransform(translationX: CGFloat.random(in: minX...maxX),
//                                                                          y: CGFloat.random(in: maxY...minY))
                
                letterLabel.translatedBy(x: CGFloat.random(in: 0...self.view.frame.size.width),
                y: CGFloat.random(in: 0...self.view.frame.size.height)
                
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
        for letterLabel in letterLabels {
            
            UIView.animate(withDuration: 2.0) {
                
                letterLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                letterLabel.transform = CGAffineTransform.identity
                letterLabel.backgroundColor = nil
                letterLabel.textColor = .black
            }
        }
    }
    




}
