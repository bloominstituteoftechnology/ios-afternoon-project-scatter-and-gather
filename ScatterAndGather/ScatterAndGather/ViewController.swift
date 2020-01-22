//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Zack Larsen on 12/10/19.
//  Copyright © 2019 Zack Larsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelL: UILabel!
    
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelM: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var lambdaImage: UIImageView!
    @IBOutlet weak var labelD: UILabel!
    @IBOutlet weak var labelA2: UILabel!
    
    var labels: [UILabel] = []
    var isScattered: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labels = [labelA2, labelD, labelB, labelM, labelA, labelL]
        configureImage()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func configureImage() {
        
        //        let animationBlock = {
        //            UIView.addKeyframe(withRelativeStartTime: 2.0, relativeDuration: 0) {
        //                self.lambdaImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 16.0)
        
        
        //                        self.changeColor()
        //transitionImage()
        //scatterLabels()
        //            }
        //
        //        }
    }
    
    func changeColor() {
        
        for label in labels {
            label.backgroundColor = UIColor.cyan
            label.textColor = UIColor.red
    }
    }
    
    
    func transitionImage () {
        let lambdaImageTransition = {
            UIImageView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8) {
                self.lambdaImage.center = CGPoint(x: self.view.bounds.size.width + self.lambdaImage.bounds.size.width, y: self.view.center.y)
            }
            UIImageView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.2) {
                self.lambdaImage.transform = .identity
            }
        }
        UIImageView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: lambdaImageTransition, completion: nil)
        
        
         
    }
    func scatterLabels() {
        if isScattered == true {
            let lLabel = {
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8) {
                self.labelL.center = CGPoint(x: 89, y: 300)
            }
            
        }
            UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: lLabel, completion: nil)
            let aLabel = {UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8) {
                        self.labelA.center = CGPoint(x: 30, y: 150)
                    }
                    
                }
                    UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: aLabel, completion: nil)}
                
        }
    
    
    
    //                self.labels = CGFloat.random()
    
    
    //        let randomX = CGFloat.random()
    
    // changing the alpha of the image from 1 to 0 and back again.
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        scatterLabels()
        transitionImage()
        changeColor()
        
    }
    
}




//extension CGFloat {
//    static func random() -> CGFloat {
//        return CGFloat(arc4random()) / CGFloat(UInt32.max)
//    }
//}
//
//extension UIColor {
//    static func random() -> UIColor {
//        return UIColor(red:   .random(),
//                       green: .random(),
//                       blue:  .random(),
//                       alpha: 1.0)
//    }
//}



