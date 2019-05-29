//
//  LambdaViewController.swift
//  ScatterAndGather
//
//  Created by Thomas Cacciatore on 5/29/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

class LambdaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
 
    func scatter() {
        UIView.animate(withDuration: 2.0, animations: {
            self.imageView.alpha = 0.0
        }, completion: nil)
        
        // Create a random point based on the view
        //generate a different random point for each label
        //use that point to set a random coordinate for the label to move
        
//        let x = Int.random(in: 0...Int(view.bounds.size.width))
//        let y = Int.random(in: 0...Int(view.bounds.size.height))
//        let randomPoint = CGPoint(x: x, y: y)
//
//        UIView.animate(withDuration: 2.0) {
//            self.labelL.transform = CGAffineTransform(translationX: randomPoint.x, y: randomPoint.y)
//        }
        
        
        
        
        //Assign a random background color to labels
        self.labelL.backgroundColor = .random
        self.labelA.backgroundColor = .random
        self.labelM.backgroundColor = .random
        self.labelB.backgroundColor = .random
        self.labelD.backgroundColor = .random
        self.labelA2.backgroundColor = .random
        
        // Rotate labels
        
        UIView.animate(withDuration: 2.0) {
            self.labelL.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...360))
            self.labelA.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...360))
            self.labelM.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...360))
            self.labelB.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...360))
            self.labelD.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...360))
            self.labelA2.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...360))
        }
        
        
    }
    
   
        
        
    func gather() {
        
    }
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        scatter()
    }
    
    
    
    var isScattered: Bool = false
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelL: UILabel!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelM: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelD: UILabel!
    @IBOutlet weak var labelA2: UILabel!
    
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha:  1.0)
    }
}
