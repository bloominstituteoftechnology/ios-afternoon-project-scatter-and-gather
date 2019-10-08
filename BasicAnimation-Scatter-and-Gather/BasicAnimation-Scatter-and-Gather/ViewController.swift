//
//  ViewController.swift
//  BasicAnimation-Scatter-and-Gather
//
//  Created by Jonalynn Masters on 10/8/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// MARK: Properties
    
    var isScattered = false
    
// MARK: Outlets
    
    @IBOutlet var lLabel: UILabel!
    @IBOutlet var firstALabel: UILabel!
    @IBOutlet var mLabel: UILabel!
   
    @IBOutlet var bLabel: UILabel!
    @IBOutlet var dLabel: UILabel!
    @IBOutlet var secondALabel: UILabel!
    
    @IBOutlet var lambdaLogoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
// MARK: Actions
    
    // isScattered = boolean that can be toggled
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        isScattered.toggle()
    }
    func fadeLogo() {
        UIView.animateKeyframes(withDuration: 4, delay: 0,options: [], animations: {
           
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 2) {
                                self.lambdaLogoImageView.alpha = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 2,
                               relativeDuration: 2) {
                                self.lambdaLogoImageView.alpha = 1
            }
        },
        completion: nil)
    
    
}

}
