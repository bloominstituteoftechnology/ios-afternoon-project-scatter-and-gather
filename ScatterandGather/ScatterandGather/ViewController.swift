//
//  ViewController.swift
//  ScatterandGather
//
//  Created by Joe Thunder on 11/17/19.
//  Copyright © 2019 LambdaSchool.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var libraLabel: UILabel!
    @IBOutlet weak var alphaOneLabel: UILabel!
    @IBOutlet weak var mikeLabel: UILabel!
    @IBOutlet weak var bravoLabel: UILabel!
    @IBOutlet weak var deltaLabel: UILabel!
    @IBOutlet weak var alphaTwoLabel: UILabel!
    
    var isScattered: Bool = false
    var initalPoint: [CGPoint] = []
    var number: Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitalPoint()
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        isScattered.toggle()
        toggleLogo()
        toggleLetters()
    }
    
    // MARK: - toggles logo image to fade in and out
    func toggleLogo() {
        
        if isScattered == true {
            UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveEaseOut, animations: {
                self.logoImageView.alpha = 0.0
            }, completion: nil)
            
             } else if isScattered == false {
            UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveEaseIn, animations: {
                self.logoImageView.alpha = 1.0
            }, completion: nil)
        }
    }
    
    // MARK: - toggles Lambda letters to rotate and move.
    func toggleLetters() {
        if isScattered == true {
            randomMove(libraLabel)
            randomMove(alphaOneLabel)
            randomMove(mikeLabel)
            randomMove(bravoLabel)
            randomMove(deltaLabel)
            randomMove(alphaTwoLabel)
            } else if isScattered == false {
            putBack(libraLabel)
            number += 1
            putBack(alphaOneLabel)
            number += 1
            putBack(mikeLabel)
            number += 1
            putBack(bravoLabel)
            number += 1
            putBack(deltaLabel)
            number += 1
            putBack(alphaTwoLabel)
            number = 0
        }
    }
    
    
    func randomMove(_ letter: UILabel) {
        let randomMove = {
                       UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.5) {
                           letter.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0.0...360.0))
                       }
                       UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.5) {
                           letter.center = CGPoint(x: CGFloat.random(in: 0.0...self.view.bounds.size.width), y: CGFloat.random(in: 0.0...self.view.bounds.size.height))
                       }
                   }
                   UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: randomMove, completion: nil)
    }
    
    func putBack(_ letter: UILabel) {
        let identityMove = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.5) {
                letter.transform = .identity
                    letter.center = self.initalPoint[self.number]
                }
            }
            UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: identityMove, completion: nil)
        }
    
    func loadInitalPoint() {
        initalPoint.append(libraLabel.center)
        initalPoint.append(alphaOneLabel.center)
        initalPoint.append(mikeLabel.center)
        initalPoint.append(bravoLabel.center)
        initalPoint.append(deltaLabel.center)
        initalPoint.append(alphaTwoLabel.center)
    }
}



