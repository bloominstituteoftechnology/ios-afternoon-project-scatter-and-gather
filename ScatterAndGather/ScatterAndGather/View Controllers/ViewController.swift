//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by conner on 4/14/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var L: UILabel!
    @IBOutlet weak var A: UILabel!
    @IBOutlet weak var M: UILabel!
    @IBOutlet weak var B: UILabel!
    @IBOutlet weak var D: UILabel!
    @IBOutlet weak var A2: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var isScattered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
    }
}
