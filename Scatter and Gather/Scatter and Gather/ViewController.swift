//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Rick Wolter on 11/5/19.
//  Copyright © 2019 Richar Wolter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var isScattered: Bool = false
    
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var a1Label: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    
  lazy var labelArray = [lLabel,a1Label,mLabel,bLabel,dLabel,a2Label]
    @IBOutlet weak var lambdaImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        moveToTheBeat()
    }
    
    func moveToTheBeat(){
        
//        lambdaImageView.center = view.center
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.lambdaImageView.alpha = 0.0
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                self.lambdaImageView.transform = .identity
            }
        }
       
               
//              UIView.animate(withDuration: 4.0, animations: {
//                   self.lambdaImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
//               }) { _ in
//                   UIView.animate(withDuration: 2.0, animations: {
//                       self.lambdaImageView.transform = .identity
//                   })
//               }
//    
        
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
             self.lLabel.transform = CGAffineTransform(translationX: self.lLabel.bounds.origin.x + 300, y: self.lLabel.bounds.origin.y)
        }, completion: nil)
        //self.lLabel.transform = .identity
        
        
            
            
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
                 self.a1Label.transform = CGAffineTransform(translationX: self.a1Label.bounds.origin.x + 300, y: self.a1Label.bounds.origin.y)
            }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
                        self.mLabel.transform = CGAffineTransform(translationX: self.mLabel.bounds.origin.x + 300, y: self.mLabel.bounds.origin.y)
                   }, completion: nil)
        
        
        
        
        
    }


}
    
    
    



