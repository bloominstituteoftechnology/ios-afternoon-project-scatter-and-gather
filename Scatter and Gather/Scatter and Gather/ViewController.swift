//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Vici Shaweddy on 9/21/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    private var isScattered: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
    }
    
}

