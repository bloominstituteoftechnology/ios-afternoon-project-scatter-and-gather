//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Jesse Ruiz on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA1: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA2: UILabel!
   @IBOutlet weak var lambdaLogo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        var isScattered: Bool = false
        isScattered.toggle()
        
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 4) {
              //  self.lambdaLogo.alpha = 0
            }
            
        }, completion: nil)
    }
    
    
    // MARK: - Methods
    private func randomColor() -> CGColor {
        let red = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0).cgColor
    }
    
    private func randomArea() -> Int {
        return Int.random(in: 1...200)
    }
}

