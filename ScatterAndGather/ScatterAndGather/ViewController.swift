//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Jonathan Ferrer on 5/22/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lambdaLogo: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    var isScattered: Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered == false {
            fadeOutLogo()
            isScattered = true
        } else {
            fadeInLogo()
        }
    }

    func fadeOutLogo() {
        UIView.animate(withDuration: 2) {
           self.lambdaLogo.alpha = 0
        }
    }
    func fadeInLogo() {
        UIView.animate(withDuration: 2) {
            self.lambdaLogo.alpha = 1
        }
    }

}

