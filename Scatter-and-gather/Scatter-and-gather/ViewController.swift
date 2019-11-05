//
//  ViewController.swift
//  Scatter-and-gather
//
//  Created by Lambda_School_Loaner_204 on 11/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    // UILabels
    @IBOutlet weak var charLLabel: UILabel!
    @IBOutlet weak var charALabel: UILabel!
    @IBOutlet weak var charMLabel: UILabel!
    @IBOutlet weak var charBLabel: UILabel!
    @IBOutlet weak var charDLabel: UILabel!
    @IBOutlet weak var charAALabel: UILabel!

    // ImageViews
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Properties
    
    var isScattered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBActions
    @IBAction func toggleButtonPressed(sender: UIBarButtonItem) {
        
    }
}

