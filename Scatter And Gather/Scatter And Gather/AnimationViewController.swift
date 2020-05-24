//
//  AnimationViewController.swift
//  Scatter And Gather
//
//  Created by Bronson Mullens on 5/22/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    // MARK: - Properties
    var isScattered: Bool = false
    var letters: [UILabel] = []
    var letteredAdded: Bool = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var lLetter: UILabel!
    @IBOutlet weak var aLetter1: UILabel!
    @IBOutlet weak var mLetter: UILabel!
    @IBOutlet weak var bLetter: UILabel!
    @IBOutlet weak var dLetter: UILabel!
    @IBOutlet weak var aLetter2: UILabel!
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    
    // MARK: - IBActions
    @IBAction func toggleButtonTapped(_ sender: Any) {
        isScattered.toggle()
        animate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func animate() {
        if !letteredAdded {
            addLetters()
        }
        
        if isScattered {
            fadeOut()
            changeBGColors()
            changeTextColors()
            randomRotation()
            moveLetters()
        } else {
            fadeIn()
            returnBGColors()
            returnTextColors()
            returnRotation()
            returnLetters()
        }
    }
    
    func addLetters() {
        letters.append(lLetter)
        letters.append(aLetter1)
        letters.append(mLetter)
        letters.append(bLetter)
        letters.append(dLetter)
        letters.append(aLetter2)
    }
    
    func fadeOut() {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [],
                       animations: {
                        self.lambdaLogo.alpha = 0.0
        },
                       completion: nil)
    }
    
    func fadeIn() {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [],
                       animations: {
                        self.lambdaLogo.alpha = 1.0
        },
                       completion: nil)
    }
    
    func changeBGColors() {
        for letter in letters {
            var redColor: Double = Double.random(in: 0...1)
            redColor = redColor.truncate(places: 2)
            var greenColor: Double = Double.random(in: 0...1)
            greenColor = greenColor.truncate(places: 2)
            var blueColor: Double = Double.random(in: 0...1)
            blueColor = blueColor.truncate(places: 2)
            var randomAlpha: Double = Double.random(in: 0...1)
            randomAlpha = randomAlpha.truncate(places: 2)
            letter.backgroundColor = UIColor(red: CGFloat(redColor),
                                             green: CGFloat(greenColor),
                                             blue: CGFloat(blueColor),
                                             alpha: CGFloat(randomAlpha))
        }
    }
    
    func returnBGColors() {
        for letter in letters {
            letter.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        }
    }
    
    func changeTextColors() {
        for letter in letters {
            var redColor: Double = Double.random(in: 0...1)
            redColor = redColor.truncate(places: 2)
            var greenColor: Double = Double.random(in: 0...1)
            greenColor = greenColor.truncate(places: 2)
            var blueColor: Double = Double.random(in: 0...1)
            blueColor = blueColor.truncate(places: 2)
            var randomAlpha: Double = Double.random(in: 0...1)
            randomAlpha = randomAlpha.truncate(places: 2)
            letter.textColor = UIColor(red: CGFloat(redColor),
                                       green: CGFloat(greenColor),
                                       blue: CGFloat(blueColor),
                                       alpha: CGFloat(randomAlpha))
        }
    }
    
    func returnTextColors() {
        for letter in letters {
            letter.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    func randomRotation() {
        for letter in letters {
            let randomAngle = Int.random(in: 0...90)
            letter.transform = CGAffineTransform(rotationAngle: CGFloat(randomAngle))
        }
    }
    
    func returnRotation() {
        for letter in letters {
            letter.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
    
    func moveLetters() {
        for letter in letters {
            let randomX = CGFloat(Int.random(in: 1...100))
            let randomY = CGFloat(Int.random(in: 1...800))
            UIView.animate(withDuration: 2.0,
                           delay: 0.0,
                           options: .curveEaseOut,
                           animations: {
                            letter.transform = CGAffineTransform(translationX: randomX,
                                                                 y: randomY)
            },
                           completion: nil)
        }
    }
    
    func returnLetters() {
        for letter in letters {
            UIView.animate(withDuration: 2.0,
                           delay: 0.0,
                           options: .curveEaseIn,
                           animations: {
                            letter.transform = .identity
            },
                           completion: nil)
        }
    }
    
}

// This extension truncates doubles up to X places
extension Double {
    func truncate(places: Int) -> Double {
        return Double(floor(pow(10.0, Double(places)) * self) / pow(10.0, Double(places)))
    }
}
