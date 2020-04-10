//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Matthew Martindale on 4/8/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toggleButtonTapped(_ sender: UIBarButtonItem) {
        isScattered.toggle()
    }
    
}

