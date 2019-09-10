//
//  LambdaScatterViewController.swift
//  LambdaScatter
//
//  Created by admin on 9/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class LambdaScatterViewController: UIViewController {
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var lastALabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    var isScattered: Bool = false
    let imageLogo: ImageLogo = ImageLogo(name: "lambda_logo")
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        logoImageView.image = imageLogo.image
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        if isScattered {
            isScattered.toggle()
            
        } else {
            isScattered.toggle()
            letterScramble()
        
        UIView.animate(withDuration: 1.5) {
            self.logoImageView.alpha = 0
        }
        
      }
        

    }
    
     func letterScramble() {
        
        UIView.animate(withDuration: (4)) {
            self.lLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...5)).concatenating(CGAffineTransform(scaleX: 1.3, y: 1.3))
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
