//
//  ViewController.swift
//  Scatter
//
//  Created by Mark Gerrior on 3/17/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properites
    var isScattered = false {
        didSet {
            peformScatter()
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Actions
    @IBAction func toggleButton(_ sender: Any) {
        isScattered.toggle()
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Business logic
    
    func peformScatter() {
        print("isScattered \(isScattered)")
    }
}

