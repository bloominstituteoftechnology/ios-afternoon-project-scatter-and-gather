//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by morse on 11/5/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    // MARK: - Properties
    
    private var isScattered: Bool = false

    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    
    @IBAction func toggleButtonTapped(_ sender: Any) {
        fadeImage(withDuration: 2)
    }
    
    
    
}

