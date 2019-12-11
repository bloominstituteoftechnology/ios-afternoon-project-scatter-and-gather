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
    }
    
    //    func configureImage() {
    //        let animationBlock = {
    //            UIView.addKeyframe(withRelativeStartTime: 2.0, relativeDuration: 0) {
    //                self.lambdaImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 16.0)
    
    
    //                self.changeColor()
    //transitionImage()
    //scatterLabels()
    //            }
    //
    //        }
    //    }
    
    func changeColor() {
        
        for label in labels {
            label.backgroundColor = UIColor.random()
            label.textColor = UIColor.random()
        }
    }
    
    func transitionImage () {
        let fade = CATransition()
        self.lambdaImage.transition = cat
        UIView.animate(withDuration: 2.0) {
            self.lambdaImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            
        }
        UIView.animate(withDuration: 2.0) {
            self.lambdaImage.transform = CATransition(coder: .fade)
        }
    }
    // changing the alpha of the image from 1 to 0 and back again.
    
    func scatterLabels() {
        if isScattered == true {
            self.labels = CGFloat.random()
            
        }
    }
    //    let randomX = CGFloat.random()
    @IBAction func toggleButtonPressed(_ sender: Any) {
        
    }
    
    
    
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}


