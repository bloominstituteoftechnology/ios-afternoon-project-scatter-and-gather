//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Jake Connerly on 8/14/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    @IBOutlet weak var labelL: UILabel!
    @IBOutlet weak var labelA1: UILabel!
    @IBOutlet weak var labelM: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelD: UILabel!
    @IBOutlet weak var labelA2: UILabel!
    
    var isScattered = false

    var labelArray: [UILabel] = []
    var ogLabelPosition: [CGPoint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLabelArray()
    }

    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        isScattered.toggle()
        
        if isScattered {
            scatter()
            toggleButton.title = "Reset"
            title = "Scatter!!!"
        } else {
            reset()
            toggleButton.title = "Yes?"
            title = "Scatter?"
        }
        
    }
    
    private func loadLabelArray() {
        labelArray.append(contentsOf: [labelL, labelA1, labelM, labelB, labelD, labelA2])
        ogLabelPosition = [labelL.center, labelA1.center, labelM.center, labelB.center, labelD.center, labelA2.center]
    }
    
    func scatter() {
        let scatterBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 2.0, animations: {
                for label in self.labelArray {
                    let randomX = CGFloat.random(in: 1...400)
                    let randomY = CGFloat.random(in: 118...800)
                    let randomRotation = CGFloat.random(in: 1...100)
                    label.transform = CGAffineTransform(rotationAngle: randomRotation)
                    label.center.x = randomX
                    label.center.y = randomY
                    
                }
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                for label in self.labelArray {
                    let randomRotation = CGFloat.random(in: 1...100)
                    label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / randomRotation)
                }
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                for label in self.labelArray {
                    let randomRotation = CGFloat.random(in: 1...100)
                    label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / randomRotation)
                    
                }
            })
        }
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: scatterBlock, completion: nil)
    }
    
    func reset() {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
            
            for (index, label) in self.labelArray.enumerated() {
                label.transform = .identity
                label.center = self.ogLabelPosition[index]

            }
        }, completion: nil)
    }
    
}

