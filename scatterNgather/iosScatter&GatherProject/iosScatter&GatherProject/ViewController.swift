//
//  ViewController.swift
//  iosScatter&GatherProject
//
//  Created by BrysonSaclausa on 7/23/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool = false
    
    @IBOutlet weak var labelL: UILabel!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelM: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelD: UILabel!
    @IBOutlet weak var labelA2: UILabel!
    @IBOutlet weak var lambdaLogoImage: UIImageView!
    
    var randomPointInt1 = CGFloat.random(in: -50...300)
    var randomPointInt2 = CGFloat.random(in: 0...300)
    var randomRotateInt = CGFloat.random(in: 2...6 )

 
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
     print("togglePressed")
     //labelD.center = view.center
     UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: {
         UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
             self.labelD.transform = CGAffineTransform(rotationAngle: .pi / self.randomRotateInt)
         }
         UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
             self.labelD.transform = CGAffineTransform(translationX: self.randomPointInt2, y: self.randomPointInt1)
         }
                        
     }, completion: nil)
     
     
     UIView.animate(withDuration: 1) {
         self.lambdaLogoImage.alpha = 0
        
     }
     
     UIView.animate(withDuration: 3) {
         self.labelL.center = CGPoint(x: self.randomPointInt1, y: self.randomPointInt2)
         self.labelA.center = CGPoint(x: self.randomPointInt2, y: self.randomPointInt1)
         self.labelA2.center = CGPoint(x: self.randomPointInt1, y: self.randomPointInt2)
     }
      
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
