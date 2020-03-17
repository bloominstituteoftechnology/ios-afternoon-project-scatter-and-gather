//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Karen Rodriguez on 3/17/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isScattered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func toggleButtonPressed(_ sender: Any) {
        isScattered.toggle()
    }
}

