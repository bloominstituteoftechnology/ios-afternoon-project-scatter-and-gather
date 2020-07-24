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
    
 
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        print("togglePressed")
        labelA.center = view.center
        UIView.animateKeyframes(withDuration: 3.0, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.5) {
                self.labelA.transform = CGAffineTransform(translationX: 0, y: -50)
            }
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.labelA.transform = .identity
            }
        }, completion: nil)
      
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
