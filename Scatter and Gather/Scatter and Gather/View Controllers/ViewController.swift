//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Michael Stoffer on 6/11/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var isScattered: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBActions and Methods
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        isScattered = !isScattered
    }
    
}

