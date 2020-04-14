//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Cameron Collins on 4/14/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    
    //Variables
    var isScattered = false
    lazy var labelHolder = [firstLabel, secondLabel, thirdLabel, fourthLabel, fifthLabel, sixthLabel]
    var backgroundColorHolder: [UIColor] = [.blue, .orange, .cyan, .green, .magenta, .red, .yellow]
    var textColorHolder: [UIColor] = [.brown, .white, .black]
    lazy var maxX = view.bounds.maxX
    lazy var maxY = view.bounds.maxY
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Actions
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        isScattered = !isScattered
        
        if isScattered == true {
            changeLabelColor()
            animateRandom()
        } else {
            changeLabelColor()
            animateReturn()
        }
    }
    
    func animateRandom() {
        UIView.animateKeyframes(withDuration: 3.0, delay: 0.0, options: [], animations: {
            //Translation and Alpha;
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {

                for i in self.labelHolder {
                    if let label = i {
                        label.transform = CGAffineTransform(translationX: CGFloat.random(in: 0.0...self.maxX) - label.frame.origin.x, y: CGFloat.random(in: 0.0...self.maxY) - label.frame.origin.y)
                    }
                }
                self.imageView.alpha = 0
            }
            
           /* UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                for i in self.labelHolder {
                    if let label = i {
                        let angle = CGFloat.random(in: 0.0...360.0)
                        label.transform = CGAffineTransform(rotationAngle: .pi/180 * angle)
                    }
                }
            }*/
        }, completion: nil)
    }
    
    func animateReturn() {
        
        //Return Animated Elements back to their original position
        UIView.animateKeyframes(withDuration: 2.5, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 1.0) {

                for i in self.labelHolder {
                    if let label = i {
                        label.transform = .identity
                    }
                }
                
                self.imageView.alpha = 1
            }
        }, completion: nil)
    }
    
    func changeLabelColor() {
        if isScattered == true {
            for i in labelHolder {
                i?.textColor = textColorHolder[Int.random(in: 0...textColorHolder.count - 1)]
                i?.backgroundColor = backgroundColorHolder[Int.random(in: 0...backgroundColorHolder.count - 1)]
            }
        } else {
            for i in labelHolder {
                i?.textColor = .black
                i?.backgroundColor = .clear
            }
        }
    }
    
}

