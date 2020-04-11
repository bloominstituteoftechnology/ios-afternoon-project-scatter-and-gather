//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Jarren Campos on 4/10/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var isScattered = false
    
    
    @IBOutlet var lambdaLogo: UIImageView!
    @IBOutlet var lLabel: UILabel!
    @IBOutlet var aLabel: UILabel!
    @IBOutlet var mLabel: UILabel!
    @IBOutlet var bLabel: UILabel!
    @IBOutlet var dLabel: UILabel!
    @IBOutlet var aALabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toggleButtonPressed_(_ sender: Any) {
        if isScattered == false{
            isScattered = true
        } else {
            isScattered = false
        }
    }
    
}

