//
//  ViewController.swift
//  ScatterGather
//
//  Created by Shawn Gee on 3/17/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBActions
    
    @IBAction func toggleButtonPressed(_ sender: Any) {
        isScattered.toggle()
    }
    
    
    // MARK: - Private
    private var isScattered = false
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

