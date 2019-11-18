//
//  ViewController.swift
//  ScatterandGather
//
//  Created by Joe Thunder on 11/17/19.
//  Copyright © 2019 LambdaSchool.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var libraLabel: UILabel!
    @IBOutlet weak var alphaOneLabel: UILabel!
    @IBOutlet weak var mikeLabel: UILabel!
    @IBOutlet weak var bravoLabel: UILabel!
    @IBOutlet weak var deltaLabel: UILabel!
    @IBOutlet weak var alphaTwoLabel: UILabel!
    
    var isScattered: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        toggleLogo()
//        toggleLetters()
    }
    
    // MARK: - toggles logo image to fade in and out
    func toggleLogo() {
        isScattered.toggle()
        if isScattered == true {
            UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveEaseOut, animations: {
                self.logoImageView.alpha = 0.0
            }, completion: nil)
            
             } else if isScattered == false {
            UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveEaseIn, animations: {
                self.logoImageView.alpha = 1.0
            }, completion: nil)
        }
    }
    
    // MARK: - toggles Lambda letters to rotate and move.
    func toggleLetters() {
        if isScattered == true {
                   
            } else if isScattered == false {
                   
        }
    }
    
    
    
    
    
}

