//
//  ViewController.swift
//  scatter-gather
//
//  Created by ronald huston jr on 5/12/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //  MARK: - properties
    var isScattered: Bool = false
    var letters: [UILabel] = []
    
    //  MARK: - outlets
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    
    
    //  MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleButton.title = "mad scatter"
        collectLettersForAnimation()
    }
    
    //  MARK: - methods for project objective
    
    private func scatterAnimate() {
        //  one idea is to group labels together in order to perform animation via built loop
        let animation = {
            
            //  in order to fade out Llama logo
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 3.0) {
                self.logoView.alpha = 0
            }
            
            //  one loop to scatter, rotate, and affect background color
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 2.0) {
                for label in self.letters {
                    label.transform = self.calculateScatterPlot(label: label)
                    label.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...358))
                    label.layer.backgroundColor = self.assignRandomBackColor().cgColor
                }
            }
            
        }
        UIView.animateKeyframes(withDuration: 2.7,
                                delay: 0.0,
                                options: [],
                                animations: animation,
                                completion: nil)
        isScattered = true
    }
    
    private func startGatherAnimation() {
        
        UIView.animate(withDuration: 2.7) {
            for label in self.letters {
                label.layer.backgroundColor = UIColor.gray.cgColor
                label.transform = .identity
            }
            self.logoView.alpha = 1
        }
        isScattered = false
    }
    
    private func collectLettersForAnimation() {
        letters.append(lLabel)
        letters.append(aLabel)
        letters.append(mLabel)
        letters.append(bLabel)
        letters.append(dLabel)
        letters.append(a2Label)
    }

    private func calculateScatterPlot(label: UILabel) -> CGAffineTransform {
        let xMinimum = -label.frame.origin.x + self.view.safeAreaInsets.left
        let xMaximum = self.view.frame.width - xMinimum
        let yMinimum = -label.frame.origin.y + self.view.safeAreaInsets.top
        let yMaximum = self.view.frame.height - yMinimum
        let transform = CGAffineTransform(translationX: CGFloat.random(in: xMinimum...xMaximum),
                                          y: CGFloat.random(in: yMinimum...yMaximum))
        return transform
    }
    
    
    private func assignRandomBackColor() -> UIColor {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        return randomColor
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        switch isScattered {
        case false:
            toggleButton.title = "gather"
            scatterAnimate()
            
        case true:
            toggleButton.title = "scatter"
            startGatherAnimation()
        }
    }
}
