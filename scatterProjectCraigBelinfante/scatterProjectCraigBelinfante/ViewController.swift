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
      /*
        func fadeIn(_ duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
            UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
                   self.lambdaImage = 1
           }, completion: completion)  }

           func fadeOut(_ duration: TimeInterval = 0.5, delay: TimeInterval = 1.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
            UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
                   self.lambdaImage = .3
           }, completion: completion)
          }
        
        UIImageView.animate(withDuration: 2.0, animations: {
            self.lambdaImage.transform = CGAffineTransform(
        }) { (_) in
            <#code#>
        }
        */
        
    }
    
    private func updateViews() {
        lambdaL.text = "L"
        lambdaA.text = "A"
        lambdaM.text = "M"
        lambdaB.text = "B"
        lambdaD.text = "D"
        lambdaLastA.text = "A"
    }
    

}

