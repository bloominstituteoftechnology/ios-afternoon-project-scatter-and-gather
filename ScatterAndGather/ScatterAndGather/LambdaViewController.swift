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
        
//        UIView.animate(withDuration: 2.0) {
//            let randomX = Int.random(in: 1...300)
//            let randomY = Int.random(in: 1...300)
//            let randomL = CGPoint(x: randomX, y: randomY)
//            self.labelL.transform = CGAffineTransform(translationX: randomL.x, y: randomL.y)
//           let randomA = CGPoint(x: randomX, y: randomY)
//            self.labelA.transform = CGAffineTransform(translationX: randomA.x, y: randomA.y)
//            let randomM = CGPoint(x: randomX, y: randomY)
//            self.labelM.transform = CGAffineTransform(translationX: randomM.x, y: randomM.y)
//          let randomB = CGPoint(x: randomX, y: randomY)
//            self.labelB.transform = CGAffineTransform(translationX: randomB.x, y: randomB.y)
//            let randomD = CGPoint(x: randomX, y: randomY)
//            self.labelD.transform = CGAffineTransform(translationX: randomD.x, y: randomD.y)
//            let randomA2 = CGPoint(x: randomX, y: randomY)
//            self.labelA2.transform = CGAffineTransform(translationX: randomA2.x, y: randomA2.y)
//        }
    }
    
        // Create a random point based on the view.
        //generate a different random point for each label
        //use that point to set a random coordinate for the label to move
        
        
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
