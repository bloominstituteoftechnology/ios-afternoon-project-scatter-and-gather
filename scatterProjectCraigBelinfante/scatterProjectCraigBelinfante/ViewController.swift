//
//  ViewController.swift
//  scatterProjectCraigBelinfante
//
//  Created by Craig Belinfante on 7/26/20.
//  Copyright © 2020 Craig Belinfante. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    @IBOutlet weak var lambdaL: UILabel!
    @IBOutlet weak var lambdaA: UILabel!
    @IBOutlet weak var lambdaM: UILabel!
    @IBOutlet weak var lambdaB: UILabel!
    @IBOutlet weak var lambdaD: UILabel!
    @IBOutlet weak var lambdaLastA: UILabel!
    @IBOutlet weak var lambdaImage: UIImageView!
    @IBOutlet weak var toggle: UIBarButtonItem!
    
    @IBAction func toggleButton(_ sender: UIBarButtonItem) {
        toggleButtonPressed()
        
    }
    
    func randomNumber() -> CGFloat {
        let number = CGFloat(arc4random_uniform(300))
        return number
    }
    
    private func updateViews() {
        lambdaL.text = "L"
        lambdaA.text = "A"
        lambdaM.text = "M"
        lambdaB.text = "B"
        lambdaD.text = "D"
        lambdaLastA.text = "A"
    }
    
    @objc func toggleButtonPressed() {
        let fade = {
            UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 5, options: [], animations: {
                self.lambdaImage.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1.0, relativeDuration: 1.0) {
                self.lambdaL.transform = CGAffineTransform(scaleX: self.randomNumber() , y: self.randomNumber() )
                self.lambdaL.backgroundColor = .green
            }
            
            
        }
        UIView.animateKeyframes(withDuration: 3.0, delay: 0.0, options: [], animations: fade, completion: nil)
    }
}


/*UIView.animateWithDuration(5, options: [.Repeat, .Autoreverse], animations: {
    self.postPacketView.center.x = completionMethodX()
    self.postPacketView.center.y = completionMethodY()

    }, completion: nil
})*/

