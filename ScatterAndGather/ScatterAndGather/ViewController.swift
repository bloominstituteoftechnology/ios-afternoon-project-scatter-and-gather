//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Cameron Collins on 4/14/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    
    //Variables
    var isScattered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    //Actions
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        isScattered = !isScattered
    }
    
    
    
}

